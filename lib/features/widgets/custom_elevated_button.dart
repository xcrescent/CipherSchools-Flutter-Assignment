import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.alignment,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    required this.text,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final EdgeInsets? margin;

  final VoidCallback? onPressed;

  final ButtonStyle? buttonStyle;

  final Alignment? alignment;

  final TextStyle? buttonTextStyle;

  final bool? isDisabled;

  final double? height;

  final double? width;

  final String text;

  final EdgeInsets? padding;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final double? elevation;

  final double? focusElevation;

  final double? hoverElevation;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 56,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
