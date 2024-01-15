import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:assignment/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarProvider extends Notifier<List<bool>> {
  void changeBottomBar(int index) {
    for (var i = 0; i < state.length; i++) {
      if (i == index) {
        state[i] = true;
        continue;
      }
      state[i] = false;
    }
  }

  @override
  List<bool> build() {
    return List.generate(4, (index) => index == 0);
  }
}

final bottomBarProvider = NotifierProvider<BottomBarProvider, List<bool>>(
  BottomBarProvider.new,
  name: 'bottomBarProvider',
);

class CustomBottomAppBar extends ConsumerStatefulWidget {
  const CustomBottomAppBar({super.key, this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  ConsumerState<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends ConsumerState<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    List<BottomMenuModel> bottomMenuList = [
      BottomMenuModel(
        icon: "assets/images/img_nav_home.svg",
        title: AppLocalizations.of(context).lbl_home,
        type: BottomBarEnum.home,
        isSelected: ref.watch(bottomBarProvider)[0],
      ),
      BottomMenuModel(
        icon: "assets/images/img_nav_transaction.svg",
        title: AppLocalizations.of(context).lbl_transaction,
        type: BottomBarEnum.transaction,
        isSelected: ref.watch(bottomBarProvider)[1],
      ),
      BottomMenuModel(
        icon: "assets/images/img_nav_budget.svg",
        title: AppLocalizations.of(context).lbl_budget,
        type: BottomBarEnum.budget,
        isSelected: ref.watch(bottomBarProvider)[2],
      ),
      BottomMenuModel(
        icon: "assets/images/img_nav_profile.svg",
        title: AppLocalizations.of(context).lbl_profile,
        type: BottomBarEnum.profile,
        isSelected: ref.watch(bottomBarProvider)[3],
      )
    ];

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            bottomMenuList.length,
            (index) {
              return InkWell(
                onTap: () {
                  ref.read(bottomBarProvider.notifier).changeBottomBar(index);
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 24,
                      width: 24,
                      color: ref.watch(bottomBarProvider)[index]
                          ? const Color(0xff7F3DFF)
                          : const Color(0xffC6C6C6),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: ref.watch(bottomBarProvider)[index]
                              ? const Color(0xff7F3DFF)
                              : const Color(0xffC6C6C6),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  home,
  transaction,
  budget,
  profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
