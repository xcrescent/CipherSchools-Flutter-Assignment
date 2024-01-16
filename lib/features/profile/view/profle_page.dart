import 'package:assignment/features/auth/controller/auth_controller.dart';
import 'package:assignment/features/widgets/custom_icon_button.dart';
import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:assignment/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  ConsumerState<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color(0xffF6F6F6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              _buildProfileRow(context),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 3,
                      ),
                      child: _buildSearchRow(
                        imagePath: "assets/images/img_user_primary.svg",
                        context,
                        settingsText: AppLocalizations.of(context).lbl_account,
                      ),
                    ),
                    const Divider(
                      color: Color(0xffE5E5E5),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 3,
                      ),
                      child: _buildSearchRow(
                        imagePath: "assets/images/img_search.svg",
                        context,
                        settingsText: AppLocalizations.of(context).lbl_settings,
                      ),
                    ),
                    const Divider(
                      color: Color(0xffE5E5E5),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 3,
                      ),
                      child: _buildSearchRow(
                        imagePath:
                            "assets/images/img_magicons_outline_user_primary.svg",
                        context,
                        settingsText:
                            AppLocalizations.of(context).lbl_export_data,
                      ),
                    ),
                    const Divider(
                      color: Color(0xffE5E5E5),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 3,
                      ),
                      child: _buildSearchRow(
                        context,
                        imagePath:
                            "assets/images/img_magicons_outline_user_red_500.svg",
                        settingsText: AppLocalizations.of(context).lbl_logout,
                        onTap: () {
                          ref.read(authControllerProvider).signOut().then(
                              (value) => context.router
                                  .replaceNamed('/getting-started'));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: 'assets/images/img_rectangle_9.png',
            height: 80,
            width: 80,
            radius: BorderRadius.circular(
              40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 19,
              top: 13,
              bottom: 13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).lbl_username,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff91919F),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppLocalizations.of(context).lbl_khushi_sharma,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff161719),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 11,
              top: 18,
              bottom: 22,
            ),
            child: CustomIconButton(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xffF1F1FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xffF1F1FA),
                  width: 1,
                ),
              ),
              child: CustomImageView(
                imagePath: "assets/images/img_magicons_outline_user.svg",
                height: 32,
                width: 32,
                color: const Color(0xff212325),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSearchRow(
    BuildContext context, {
    required String settingsText,
    required String imagePath,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 12,
          bottom: 12,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: CustomIconButton(
                height: 52,
                width: 52,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffEEE5FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomImageView(
                  imagePath: imagePath,
                  color: const Color(0xff7F3DFF),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 9,
                top: 17,
                bottom: 15,
              ),
              child: Text(
                settingsText,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff292B2D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
