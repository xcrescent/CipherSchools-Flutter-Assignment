import 'package:assignment/features/auth/controller/auth_controller.dart';
import 'package:assignment/features/widgets/custom_icon_button.dart';
import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:assignment/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        // backgroundColor: appTheme.gray100,
        body: Container(
          width: double.maxFinite,
          // decoration: AppDecoration.fillGray100,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildProfileRow(context),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 3,
                  ),
                  child: _buildSearchRow(
                    context,
                    settingsText: AppLocalizations.of(context).lbl_account,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 3,
                  ),
                  child: _buildSearchRow(
                    context,
                    settingsText: AppLocalizations.of(context).lbl_settings,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 3,
                  ),
                  child: _buildSearchRow(
                    context,
                    settingsText: AppLocalizations.of(context).lbl_export_data,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 3,
                  ),
                  child: _buildSearchRow(
                    context,
                    settingsText: AppLocalizations.of(context).lbl_logout,
                    onTap: () {
                      ref.read(authControllerProvider).signOut().then((value) =>
                          context.router.replaceNamed('/getting-started'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                  // style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  AppLocalizations.of(context).lbl_khushi_sharma,
                  // style: theme.textThemeeadlineSmall,
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
              // decoration: IconButtonStyleHelper.outlineGray,
              child: CustomImageView(
                  // imagePath: ImageConstant.imgMagiconsOutlineUser,
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
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 18,
        ),
        // decoration: AppDecoration.border,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: CustomIconButton(
                height: 52,
                width: 52,
                padding: const EdgeInsets.all(10),
                child: CustomImageView(
                    // imagePath: ImageConstant.imgSearch,
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
                // style: theme.textTheme.titleMedium!.copyWith(
                //   color: theme.colorScheme.errorContainer,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
