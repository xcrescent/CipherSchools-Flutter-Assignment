import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/local_storage/transaction_storage_pod.dart';
import '../../../l10n/l10n.dart';
import '../../add_expense_income/model/transaction_model.dart';
import '../../home/notifier/home_tab_container_notifier.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';

@RoutePage(
  deferredLoading: true,
)
class TransactionPage extends ConsumerWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: const Color(0xff292B2D),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            ref.watch(getTransactionProvider).when(
              data: (data) {
                if (data!.isEmpty) {
                  return const Center(
                    child: Text("No Transaction"),
                  );
                }
                print(data);
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: _buildTransaction(
                            context,
                            title: data[index].title,
                            description: data[index].description,
                            price: data[index].price,
                            time: data[index].time,
                            index: index,
                            transactionType: data[index].transactionType,
                            walletName: data[index].walletName,
                            ref: ref,
                          ),
                        );
                      },
                      itemCount: data!.length),
                );
              },
              error: (error, stackTrace) {
                return const SizedBox();
              },
              loading: () {
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransaction(
    BuildContext context, {
    required String title,
    required String description,
    required String price,
    required DateTime time,
    required int index,
    required TransactionType transactionType,
    required String walletName,
    required WidgetRef ref,
  }) {
    String imagePath = "assets/images/img_magicons_glyph_ecommerce.svg";
    Color color = const Color(0xffFCAC12);
    Color backgroundColor = const Color(0xffFCFCFC);
    if (title == "Shopping") {
      color = const Color(0xffFCAC12);
      backgroundColor = const Color(0xffFCEED4);
      imagePath = "assets/images/img_magicons_glyph_ecommerce.svg";
    } else if (title == "Subscription") {
      color = const Color(0xff7F3DFF);
      backgroundColor = const Color(0xffEEE5FF);
      imagePath = "assets/images/img_magicons_glyph_primary.svg";
    } else if (title == "Travel") {
      color = const Color(0xff004685);
      backgroundColor = const Color(0xffF1F1FA);
      imagePath = "assets/images/img_magicons_glyph_travel_car.svg";
    } else if (title == "Food") {
      color = const Color(0xffFD3C4A);
      backgroundColor = const Color(0xffFDD5D7);
      imagePath = "assets/images/img_magicons_glyph_red_500.svg";
    } else {
      color = const Color(0xff00A86B);
      backgroundColor = const Color(0xffF1F1FA);
      imagePath = "assets/images/img_user_primary.svg";
    }

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart ||
            direction == DismissDirection.startToEnd) {
          print("Delete");
          Hive.box<TransactionModel>('transaction_data').deleteAt(index);
          var x = ref.refresh(getTransactionProvider);
          var y = ref.refresh(totalIncomeProvider);
          var z = ref.refresh(totalExpenseProvider);
          var a = ref.refresh(totalBalanceProvider);
        }
      },
      child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${transactionType == TransactionType.expense ? "-" : "+"} ${AppLocalizations.of(context).lbl} $price",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: transactionType == TransactionType.expense
                          ? const Color(0xffFD3C4A)
                          : const Color(0xff00A86B),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}",
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
      ),
    );
  }
}
