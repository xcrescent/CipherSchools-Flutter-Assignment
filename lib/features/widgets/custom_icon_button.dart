import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  // color: appTheme.deepPurple50,
                  borderRadius: BorderRadius.circular(16),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
// extension IconButtonStyleHelper on CustomIconButton {
//   static BoxDecoration get fillGrayBf => BoxDecoration(
//         color: appTheme.gray300Bf,
//         borderRadius: BorderRadius.circular(45.h),
//       );
//   static BoxDecoration get fillOrange => BoxDecoration(
//         color: appTheme.orange50,
//         borderRadius: BorderRadius.circular(16.h),
//       );
//   static BoxDecoration get fillGray => BoxDecoration(
//         color: appTheme.gray10001,
//         borderRadius: BorderRadius.circular(16.h),
//       );
//   static BoxDecoration get fillRed => BoxDecoration(
//         color: appTheme.red100,
//         borderRadius: BorderRadius.circular(16.h),
//       );
//   static BoxDecoration get fillGrayTL20 => BoxDecoration(
//         color: appTheme.gray50,
//         borderRadius: BorderRadius.circular(20.h),
//       );
//   static BoxDecoration get outlineGray => BoxDecoration(
//         borderRadius: BorderRadius.circular(8.h),
//         border: Border.all(
//           color: appTheme.gray10001,
//           width: 1.h,
//         ),
//       );
//   static BoxDecoration get fillDeepOrange => BoxDecoration(
//         color: appTheme.deepOrange50,
//         borderRadius: BorderRadius.circular(16.h),
//       );
// }
