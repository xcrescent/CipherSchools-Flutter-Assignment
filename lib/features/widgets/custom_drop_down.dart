import 'package:assignment/features/home/models/selection_popup_model.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.alignment,
    this.width,
    this.focusNode,
    this.icon,
    this.autofocus = true,
    this.textStyle,
    this.items,
    thisintText,
    thisintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    thisalidator,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final List<SelectionPopupModel>? items;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<SelectionPopupModel>? validator;

  final Function(SelectionPopupModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: dropDownWidget,
          )
        : dropDownWidget;
  }

  Widget get dropDownWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: DropdownButtonFormField<SelectionPopupModel>(
          focusNode: focusNode ?? FocusNode(),
          icon: icon,
          autofocus: autofocus!,
          // style: textStyle ?? CustomTextStyles.titleSmallGray900,
          items: items?.map((SelectionPopupModel item) {
            return DropdownMenuItem<SelectionPopupModel>(
              value: item,
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
                // style: hintStyle ?? theme.textTheme.bodyLarge,
              ),
            );
          }).toList(),
          decoration: decoration,
          validator: validator,
          onChanged: (value) {
            onChanged!(value!);
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        // hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.only(
              left: 16,
              top: 18,
              bottom: 18,
            ),
        // fillColor: fillColor ?? appTheme.whiteA700,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                // color: appTheme.gray10001,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                // color: appTheme.gray10001,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                // color: appTheme.gray10001,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomDropDown] to facilitate inclusion of all types of border style etc
extension DropDownStyleHelper on CustomDropDown {
  static OutlineInputBorder get outlineGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          // color: appTheme.gray10001,
          width: 1,
        ),
      );
}
