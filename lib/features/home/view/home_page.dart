import 'package:assignment/features/home/models/incomecomponent_item_model.dart';
import 'package:assignment/features/home/notifier/home_tab_container_notifier.dart';
import 'package:assignment/features/home/widgets/incomecomponent_item_widget.dart';
import 'package:assignment/features/widgets/app_bar/appbar_leading_image.dart';
import 'package:assignment/features/widgets/app_bar/appbar_title_dropdown.dart';
import 'package:assignment/features/widgets/app_bar/custom_app_bar.dart';
import 'package:assignment/features/widgets/custom_icon_button.dart';
import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:assignment/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  // late ThemeData theme;
  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
    // theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(240),
        child: HomeAppBar(),
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTabview(context),
            SizedBox(
              height: 356,
              child: TabBarView(
                controller: tabviewController,
                children: [
                  _buildScrollView(context),
                  _buildScrollView(context),
                  _buildScrollView(context),
                  _buildScrollView(context),
                  // HomePage(),
                  // HomePage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 34,
      width: 346,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: appTheme.gray50, width: 1),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        // labelColor: appTheme.amberA700,
        labelStyle: const TextStyle(
            fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700),
        // unselectedLabelColor: Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedLabelStyle: const TextStyle(
            fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),
        indicator: BoxDecoration(
          // color: appTheme.orange50,
          borderRadius: BorderRadius.circular(16),
        ),
        tabs: const [
          Tab(
            child: Text("lbl_today"),
          ),
          Tab(
            child: Text("lbl_week"),
          ),
          Tab(
            child: Text("lbl_month"),
          ),
          Tab(
            child: Text("lbl_year"),
          )
        ],
      ),
    );
  }

  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          "msg_recent_transaction",
                          // style: CustomTextStyles.titleMediumSemiBold,
                        ),
                      ),
                      // CustomElevatedButton(
                      //   height: 32,
                      //   width: 78,
                      //   text: "lbl_see_all",
                      //   buttonStyle: CustomButtonStyles.fillDeepPurple,
                      //   buttonTextStyle: CustomTextStyles.titleSmallPrimary,
                      // ),
                    ],
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
                    shopping: "lbl_shopping",
                    buyAnAvocado: "msg_buy_some_grocery",
                    price: "lbl_120",
                    time: "lbl_10_00_am",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 28,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // decoration: AppDecoration.fillGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.roundedBorder24,
                  // ),
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
                          // child: CustomImageView(
                          //   imagePath: ImageConstant.imgMagiconsGlyphPrimary,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          top: 6,
                          bottom: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_subscription",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "msg_disney_annual",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: _buildCardTransactionColumn(
                          context,
                          price: "lbl_499",
                          time: "lbl_03_30_pm",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 28,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // decoration: AppDecoration.fillGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.roundedBorder24,
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: CustomIconButton(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(11),
                          // decoration: IconButtonStyleHelper.fillGray,
                          child: CustomImageView(
                              // imagePath: ImageConstant.imgMagiconsGlyphTravelCar,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "lbl_travel",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              "msg_chandigarh_to_de",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: _buildCardTransactionColumn(
                          context,
                          price: "lbl_1000",
                          time: "lbl_10_00_am",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    right: 28,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // decoration: AppDecoration.fillGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.roundedBorder24,
                  // ),
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
                          // decoration: IconButtonStyleHelper.fillRed,
                          // child: CustomImageView(
                          //   imagePath: ImageConstant.imgMagiconsGlyphRed500,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "lbl_food",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const Text(
                                  "lbl_32",
                                  // style: CustomTextStyles.titleMediumRed500,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(
                                    "lbl_buy_a_ramen",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                Text(
                                  "lbl_07_30_pm",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    right: 28,
                  ),
                  child: _buildFrameSixRow(
                    context,
                    shopping: "lbl_shopping",
                    buyAnAvocado: "msg_buy_some_grocery",
                    price: "lbl_120",
                    time: "lbl_10_00_am",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildCardTransactionColumn(
    BuildContext context, {
    required String price,
    required String time,
  }) {
    return Column(
      children: [
        Text(
          price,
          // style: CustomTextStyles.titleMediumRed500.copyWith(
          //   color: appTheme.red500,
          // ),
        ),
        const SizedBox(height: 12),
        Text(
          time,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildFrameSixRow(
    BuildContext context, {
    required String shopping,
    required String buyAnAvocado,
    required String price,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      // decoration: AppDecoration.fillGray.copyWith(
      //   borderRadius: BorderRadiusStyle.roundedBorder24,
      // ),
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
              // decoration: IconButtonStyleHelper.fillOrange,
              // child: CustomImageView(
              //   imagePath: ImageConstant.imgMagiconsGlyphEcommerceAmberA700,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 9,
              top: 7,
              bottom: 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopping,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.errorContainer,
                      ),
                ),
                const SizedBox(height: 11),
                Text(
                  buyAnAvocado,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                    // style: CustomTextStyles.titleMediumRed500.copyWith(
                    //   color: appTheme.red500,
                    // ),
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  time,
                  // style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  //   color: Theme.of(context).colorScheme.onPrimaryContainer,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
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
              imagePath: "assets/images/img_close.png",
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
                    // ref
                    //     .read(homeTabContainerNotifier.notifier)
                    //     .onSelected(value);
                  },
                );
              },
            ),
            actions: const [
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "lbl_account_balance",
            // style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            "lbl_38000",
            // style: CustomTextStyles.displayMediumInterPrimaryContaine,
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 80,
            child: Consumer(
              builder: (context, ref, _) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 11);
                  },
                  itemCount: ref
                          .watch(homeTabContainerNotifier)
                          .homeTabContainerModelObj
                          ?.incomecomponentItemList
                          .length ??
                      0,
                  itemBuilder: (context, index) {
                    IncomecomponentItemModel model = ref
                            .watch(homeTabContainerNotifier)
                            .homeTabContainerModelObj
                            ?.incomecomponentItemList[index] ??
                        IncomecomponentItemModel();
                    return IncomecomponentItemWidget(model);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 11)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
