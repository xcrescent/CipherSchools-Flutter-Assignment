import 'package:assignment/features/home/models/incomecomponent_item_model.dart';
import 'package:assignment/features/home/notifier/home_tab_container_notifier.dart';
import 'package:assignment/features/home/widgets/incomecomponent_item_widget.dart';
import 'package:assignment/features/widgets/app_bar/appbar_leading_image.dart';
import 'package:assignment/features/widgets/app_bar/appbar_title_dropdown.dart';
import 'package:assignment/features/widgets/app_bar/custom_app_bar.dart';
import 'package:assignment/features/widgets/custom_elevated_button.dart';
import 'package:assignment/features/widgets/custom_icon_button.dart';
import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:assignment/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage(
  deferredLoading: true,
)
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(256),
        child: HomeAppBar(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 256,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            _buildTabview(context),
            SizedBox(
              height: MediaQuery.of(context).size.height - 438,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: tabviewController,
                children: [
                  _buildScrollView(context),
                  _buildScrollView(context),
                  _buildScrollView(context),
                  _buildScrollView(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 38,
      width: MediaQuery.of(context).size.width - 32,
      alignment: Alignment.center,
      // margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffFCFCFC), width: 1),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,

        // labelColor: appTheme.amberA700,
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w700,
          color: const Color(0xffFCAC12),
        ),

        dividerColor: Colors.transparent,
        unselectedLabelColor: const Color(0xff91919F),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w500,
        ),
        indicator: BoxDecoration(
          color: const Color(0xffFCEED4),
          borderRadius: BorderRadius.circular(16),
        ),

        tabs: [
          Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 8,
              ),
              child: Text(
                AppLocalizations.of(context).lbl_today,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 8,
              ),
              child: Text(
                AppLocalizations.of(context).lbl_week,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 8,
              ),
              child: Text(
                AppLocalizations.of(context).lbl_month,
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26.0,
                vertical: 8,
              ),
              child: Text(
                AppLocalizations.of(context).lbl_year,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            // decoration: AppDecoration.border,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 4,
                  ),
                  child: Text(
                    AppLocalizations.of(context).msg_recent_transaction,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff292B2D),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  height: 32,
                  width: 100,
                  text: AppLocalizations.of(context).lbl_see_all,
                  elevation: 0,
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEEE5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  buttonTextStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff7F3DFF),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
            ),
            child: _buildFrameSixRow(
              context,
              color: const Color(0xffFCAC12),
              backgroundColor: const Color(0xffFCEED4),
              imagePath: "assets/images/img_magicons_glyph_ecommerce.svg",
              title: AppLocalizations.of(context).lbl_shopping,
              description: AppLocalizations.of(context).msg_buy_some_grocery,
              price: AppLocalizations.of(context).lbl_120,
              time: AppLocalizations.of(context).lbl_10_00_am,
            ),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
            ),
            child: _buildFrameSixRow(
              context,
              color: const Color(0xffFCAC12),
              backgroundColor: const Color(0xffFCEED4),
              imagePath: "assets/images/img_magicons_glyph_primary.svg",
              title: AppLocalizations.of(context).lbl_subscription,
              description: AppLocalizations.of(context).msg_disney_annual,
              price: AppLocalizations.of(context).lbl_499,
              time: AppLocalizations.of(context).lbl_03_30_pm,
            ),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
            ),
            child: _buildFrameSixRow(
              context,
              color: const Color(0xffFCAC12),
              backgroundColor: const Color(0xffFCEED4),
              imagePath: "assets/images/img_magicons_glyph_ecommerce.svg",
              title: AppLocalizations.of(context).lbl_travel,
              description: AppLocalizations.of(context).msg_chandigarh_to_de,
              price: AppLocalizations.of(context).lbl_1000,
              time: AppLocalizations.of(context).lbl_10_00_am,
            ),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
            ),
            child: _buildFrameSixRow(
              context,
              color: const Color(0xffFCAC12),
              backgroundColor: const Color(0xffFCEED4),
              imagePath: "assets/images/img_magicons_glyph_red_500.svg",
              title: AppLocalizations.of(context).lbl_food,
              description: AppLocalizations.of(context).lbl_buy_a_ramen,
              price: AppLocalizations.of(context).lbl_32,
              time: AppLocalizations.of(context).lbl_07_30_pm,
            ),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 28,
            ),
            child: _buildFrameSixRow(
              context,
              color: const Color(0xffFCAC12),
              backgroundColor: const Color(0xffFCEED4),
              imagePath: "assets/images/img_magicons_glyph_ecommerce.svg",
              title: AppLocalizations.of(context).lbl_shopping,
              description: AppLocalizations.of(context).msg_buy_some_grocery,
              price: AppLocalizations.of(context).lbl_120,
              time: AppLocalizations.of(context).lbl_10_00_am,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameSixRow(
    BuildContext context, {
    required String title,
    required String description,
    required String price,
    required String time,
    required String imagePath,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFCFCFC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: CustomIconButton(
              height: 60,
              width: 60,

              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              // decoration: IconButtonStyleHelper.fillOrange,
              child: CustomImageView(
                imagePath: imagePath,
                color: color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 11,
              top: 7,
              bottom: 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff292B2D),
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff91919F),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 8,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffFD3C4A),
                    ),
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff91919F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapClose(BuildContext context) {
    Navigator.pop(context);
  }
}

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(homeTabContainerNotifier.notifier);
    final state = ref.watch(homeTabContainerNotifier);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
        gradient: LinearGradient(
          begin: Alignment(0.53, 0.07),
          end: Alignment(0.48, 1.3),
          colors: [
            Color(0XFFFFF6E5),
            Color(0x00f8edd8),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomAppBar(
            height: 40,
            leadingWidth: 48,
            leading: AppbarLeadingImage(
              imagePath: "assets/images/img_rectangle_9.png",
              margin: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
              onTap: () {
                // onTapClose(context);
              },
            ),
            centerTitle: true,
            title: Consumer(
              builder: (context, ref, _) {
                return AppbarTitleDropdown(
                  hintText: AppLocalizations.of(context).lbl_october,
                  items: ref
                          .watch(homeTabContainerNotifier)
                          .homeTabContainerModelObj
                          ?.dropdownItemList ??
                      [],
                  onTap: (value) {
                    ref
                        .read(homeTabContainerNotifier.notifier)
                        .onSelected(value);
                  },
                );
              },
            ),
            actions: const [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Color(0xff7F3DFF),
                ),
                onPressed: null,
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            AppLocalizations.of(context).lbl_account_balance,
            style: TextStyle(
              fontSize: 14,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w500,
              color: const Color(0xff91919F),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            AppLocalizations.of(context).lbl_38000,
            style: TextStyle(
              fontSize: 40,
              fontFamily: GoogleFonts.inter().fontFamily,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: Consumer(
              builder: (context, ref, _) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width - 351) / 2),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 11);
                  },
                  itemCount: ref
                          .watch(homeTabContainerNotifier)
                          .homeTabContainerModelObj
                          ?.incomeComponentItemList
                          .length ??
                      0,
                  itemBuilder: (context, index) {
                    IncomeComponentItemModel model = ref
                            .watch(homeTabContainerNotifier)
                            .homeTabContainerModelObj
                            ?.incomeComponentItemList[index] ??
                        IncomeComponentItemModel();
                    return IncomeComponentItemWidget(model);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
