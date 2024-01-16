import 'package:assignment/features/auth/repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage(
  deferredLoading: true,
)
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    () async {
      SharedPreferences sharedPref =
          await ref.read(sharedPreferencesProvider.future);
      final uid = sharedPref.getString('uid');
      if (uid != null) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          context.router.replaceNamed('/navigation');
        });
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          context.router.replaceNamed('/getting-started');
        });
      }
    }();

    return Scaffold(
      backgroundColor: const Color(0xff7B61FF),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/icons/recordcircle.png',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/app_icon.png',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'CipherX',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: GoogleFonts.brunoAceSc().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/icons/recordcircle.png',
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 100,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By\n',
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 0.54),
              fontFamily: GoogleFonts.cambay().fontFamily,
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: 'Open Source',
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 0.54),
                  fontFamily: GoogleFonts.cambay().fontFamily,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: ' Community',
                style: TextStyle(
                  fontFamily: GoogleFonts.cambay().fontFamily,
                  color: const Color.fromRGBO(248, 164, 1, 1),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
