import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Column(
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
            height: 18,
          ),
          Row(
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
              RichText(
                overflow: TextOverflow.ellipsis,
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
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff7F3DFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(343, 48),
            ),
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFCFCFC),
              ),
            ),
          ),
          const Text(
            "Or with",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(343, 48),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/google.png",
                  width: 24,
                  height: 24,
                ),
                const Text(
                  "Sign Up with Google",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFCFCFC),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Already have an account? Login",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Row(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
