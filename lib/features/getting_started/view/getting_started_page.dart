import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage(
  deferredLoading: true,
)
class GettingStartedPage extends ConsumerWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 20),
                child: Image.asset(
                  'assets/icons/app_icon.png',
                  height: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                color: const Color(0xFFFFFFFF),
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'CipherX',
                              style: TextStyle(
                                fontFamily: GoogleFonts.brunoAceSc().fontFamily,
                                color: const Color(0xFFFFFFFF),
                                fontSize: 36,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () => context.router.pushNamed('/auth'),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xBFEDE1E1),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0xFF060607),
                              size: 48,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'The best way to track your expenses.',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
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
      // extendBody: true,
      // bottomNavigationBar: Container(
      //   alignment: Alignment.center,
      //   height: 100,
      //   child: RichText(
      //     textAlign: TextAlign.center,
      //     text: TextSpan(
      //       text: 'By\n',
      //       style: TextStyle(
      //         color: const Color.fromRGBO(255, 255, 255, 0.54),
      //         fontFamily: GoogleFonts.cambay().fontFamily,
      //         fontSize: 15,
      //       ),
      //       children: [
      //         TextSpan(
      //           text: 'Open Source',
      //           style: TextStyle(
      //             color: const Color.fromRGBO(255, 255, 255, 0.54),
      //             fontFamily: GoogleFonts.cambay().fontFamily,
      //             fontSize: 15,
      //           ),
      //         ),
      //         TextSpan(
      //           text: ' Community',
      //           style: TextStyle(
      //             fontFamily: GoogleFonts.cambay().fontFamily,
      //             color: const Color.fromRGBO(248, 164, 1, 1),
      //             fontSize: 15,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
