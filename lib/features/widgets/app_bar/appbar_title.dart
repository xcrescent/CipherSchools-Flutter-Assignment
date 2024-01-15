import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  final String text;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          // style: CustomTextStyles.titleMediumWhiteA700.copyWith(
          //   color: appTheme.whiteA700,
          // ),
        ),
      ),
    );
  }
}
