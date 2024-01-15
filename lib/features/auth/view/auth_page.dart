import 'package:assignment/features/auth/repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage(
  deferredLoading: true,
)
class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          size: 24,
          color: Color(0xFF212325),
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 18,
            color: const Color(0xFF212325),
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    autofillHints: const [AutofillHints.name],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF5F5F5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffF1F1FA),
                          style: BorderStyle.solid,
                        ),
                      ),
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff91919F),
                        height: 18,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF5F5F5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffF1F1FA),
                          style: BorderStyle.solid,
                        ),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff91919F),
                        height: 18,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF5F5F5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffF1F1FA),
                          style: BorderStyle.solid,
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff91919F),
                        height: 18,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Checkbox(
                    focusColor: Color(0xff7F3DFF),
                    hoverColor: Color(0xff7F3DFF),
                    activeColor: Color(0xff7F3DFF),
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff7F3DFF),
                      style: BorderStyle.solid,
                    ),
                    value: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      side: BorderSide(
                        width: 1,
                        color: Color(0xff7F3DFF),
                        style: BorderStyle.solid,
                      ),
                    ),
                    onChanged: null,
                    checkColor: Color(0xff7F3DFF),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: RichText(
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: "By signing up, you agree to the ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Terms of Service and Privacy Policy",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: const Color(0xff7F3DFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7F3DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width - 40, 48),
              ),
              onPressed: () {
                context.router.pushNamed("/navigation");
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFCFCFC),
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Or with",
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w700,
                color: const Color(0xff91919F),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color(0xffFFFFFF),
                minimumSize: Size(MediaQuery.of(context).size.width - 40, 48),
                maximumSize: Size(MediaQuery.of(context).size.width - 40, 48),
                side: const BorderSide(
                  width: 1,
                  color: Color(0xffE0E0E0),
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: () {
                if (kDebugMode) {
                  print("Sign Up with Google");
                }
                ref.read(authRepositoryProvider).signInWithGoogle().then(
                      (_) => _ ? context.router.pushNamed("/navigation") : null,
                    );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Sign Up with Google",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: const Color(0xFF212325),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: const Color(0xff91919F),
                    ),
                  ),
                  TextSpan(
                    text: "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: const Color(0xff7F3DFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
