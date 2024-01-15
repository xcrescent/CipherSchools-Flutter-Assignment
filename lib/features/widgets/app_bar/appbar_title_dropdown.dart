import 'package:assignment/features/home/models/selection_popup_model.dart';
import 'package:assignment/features/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitleDropdown extends StatelessWidget {
  AppbarTitleDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  List<SelectionPopupModel> items;

  Function(SelectionPopupModel) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: 107,
        hintText: hintText,
        items: items,
        prefix: Container(
          margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
          child: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        prefixConstraints: const BoxConstraints(
          maxHeight: 40,
        ),
        // borderDecoration: DropDownStyleHelper.outlineGray,
        filled: false,
        onChanged: (value) {
          onTap(value);
        },
      ),
    );
  }
}
