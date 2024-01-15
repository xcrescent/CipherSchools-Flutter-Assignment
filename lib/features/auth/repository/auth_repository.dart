import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/firebase.dart';
import '../../../const/resource.dart';
import '../../../core/providers/firebase_provider.dart';
import '../model/user_model.dart';

final userProvider = StreamProvider<User?>((ref) {
  return ref.watch(authProvider).authStateChanges();
});

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   var sPf;
//   SharedPreferences.getInstance().then((value) => sPf = value);
//   return sPf;
// });
//
// final userSharedPreferencesProvider = Provider<String?>((ref) {
//   var sPf = ref.watch(sharedPreferencesProvider);
//   return sPf.getString("uid");
// });

final currentUserProvider =
    Provider((ref) => ref.watch(userProvider).asData?.value);

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _user =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = (await googleUser?.authentication);
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (kDebugMode) {
        print("credential: $credential");
      }
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          print(userCredential.user!.displayName);
          UserModel userModel = UserModel(
            name: userCredential.user!.displayName ?? "No Name",
            profilePic: userCredential.user!.photoURL ?? R.defaultPfp,
            uid: userCredential.user!.uid,
            isAuthenticated: "true",
          );
          await _user.doc(userModel.uid).set(
                userModel.toMap(),
              );
        }
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("uid", user!.uid);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("uid");
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
