import 'package:assignment/features/widgets/custom_icon_button.dart';
import 'package:assignment/features/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/incomecomponent_item_model.dart';

class IncomeComponentItemWidget extends ConsumerWidget {
  const IncomeComponentItemWidget({
    Key? key,
    required this.width,
    required this.incomeComponentItemModelObj,
  }) : super(key: key);
  final double width;
  final IncomeComponentItemModel incomeComponentItemModelObj;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: incomeComponentItemModelObj.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 3,
              bottom: 1,
            ),
            child: CustomIconButton(
              height: 48,
              width: 48,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CustomImageView(
                imagePath: incomeComponentItemModelObj.userImage,
                height: 32,
                width: 32,
                color: incomeComponentItemModelObj.color,
              ),
            ),
          ),
          width > 170
              ? const SizedBox(
                  width: 10,
                )
              : SizedBox(
                  width: 0,
                ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incomeComponentItemModelObj.incomeText!,
                  style: TextStyle(
                    color: const Color(0xFFFCFCFC),
                    fontSize: 14,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  incomeComponentItemModelObj.amountText!,
                  style: TextStyle(
                    color: const Color(0xFFFCFCFC),
                    fontSize: 22,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
