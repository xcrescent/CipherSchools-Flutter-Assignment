import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    thiseight,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.height,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  // @override
  // Size get preferredSize => Size(
  //       SizeUtils.width,
  //       height ?? 56,
  //     );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill:
        return Container(
          height: 64,
          width: double.maxFinite,
          decoration: BoxDecoration(
              // color: appTheme.whiteA700,
              ),
        );
      default:
        return null;
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

enum Style {
  bgFill,
}
