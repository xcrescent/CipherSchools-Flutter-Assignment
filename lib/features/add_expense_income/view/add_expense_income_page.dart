import 'package:assignment/core/local_storage/transaction_storage_pod.dart';
import 'package:assignment/features/home/notifier/home_tab_container_notifier.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../l10n/l10n.dart';
import '../model/transaction_model.dart';

@RoutePage(
  deferredLoading: true,
)
class AddExpenseIncomePage extends ConsumerWidget {
  const AddExpenseIncomePage(
      {super.key, required this.color, required this.routeName});

  final Color color;

  final String routeName;

  static TextEditingController titleController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController priceController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        title: Text(routeName),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: color,
      body: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "How much?",
                    style: TextStyle(
                      color: const Color(0xffFCFCFC),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextFormField(
                      onChanged: (value) {
                        priceController.text = value;
                        formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a ${routeName == 'Add Expense' ? 'expense' : 'income'} amount";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: const Color(0xffFCFCFC),
                        fontSize: 64,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                      cursorColor: const Color(0xffFCFCFC),
                      decoration: InputDecoration(
                        hintText: '0',
                        errorStyle: TextStyle(
                          color: const Color(0xffFCFCFC),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                        error: null,
                        prefixStyle: TextStyle(
                          color: const Color(0xffFCFCFC),
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                        prefixIcon: Text(
                          AppLocalizations.of(context).lbl,
                          style: TextStyle(
                            color: const Color(0xffFCFCFC),
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: const Color(0xffFCFCFC),
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFF1F1FA),
                                width: 1,
                              ),
                            ),
                            height: 60,
                            width: MediaQuery.of(context).size.width - 60,
                            child: DropdownButtonFormField(
                              onChanged: (String? value) {
                                titleController.text = value!;
                                formKey.currentState!.validate();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Select a Category";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                // contentPadding: const EdgeInsets.symmetric(
                                //   horizontal: 20,
                                //   vertical: 10,
                                // ),
                                hintText: 'Category',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF91919F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              items: (routeName == "Add Income")
                                  ? [
                                      const DropdownMenuItem(
                                        value: "Earned Income",
                                        child: Text(
                                          "Earned Income",
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "Business Income",
                                        child: Text(
                                          "Business Income",
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "Interest Income",
                                        child: Text(
                                          "Interest Income",
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "Rental Income",
                                        child: Text(
                                          "Rental Income",
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "Other Income",
                                        child: Text(
                                          "Other Income",
                                        ),
                                      ),
                                    ]
                                  : [
                                      DropdownMenuItem(
                                        value: AppLocalizations.of(context)
                                            .lbl_subscription,
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .lbl_subscription,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: AppLocalizations.of(context)
                                            .lbl_food,
                                        child: Text(
                                          AppLocalizations.of(context).lbl_food,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: AppLocalizations.of(context)
                                            .lbl_travel,
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .lbl_travel,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: AppLocalizations.of(context)
                                            .lbl_shopping,
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .lbl_shopping,
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "Other",
                                        child: Text(
                                          "Other",
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFF1F1FA),
                                width: 1,
                              ),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                descriptionController.text = value;
                                formKey.currentState!.validate();
                              },
                              decoration: InputDecoration(
                                hintText: 'Description',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF91919F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFF1F1FA),
                                width: 1,
                              ),
                            ),
                            height: 56,
                            width: MediaQuery.of(context).size.width - 60,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Select a wallet";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                // contentPadding: const EdgeInsets.symmetric(
                                //   horizontal: 20,
                                //   vertical: 10,
                                // ),
                                floatingLabelStyle: TextStyle(
                                  color: const Color(0xFF91919F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                                hintText: 'Wallet',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF91919F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value:
                                      AppLocalizations.of(context).lbl_wallet,
                                  child: Text(
                                    AppLocalizations.of(context).lbl_wallet,
                                  ),
                                ),
                                // DropdownMenuItem(
                                //   value: AppLocalizations.of(context).lbl_food,
                                //   child: Text(
                                //     AppLocalizations.of(context).lbl_food,
                                //   ),
                                // ),
                                // DropdownMenuItem(
                                //   value: AppLocalizations.of(context).lbl_travel,
                                //   child: Text(
                                //     AppLocalizations.of(context).lbl_travel,
                                //   ),
                                // ),
                                // DropdownMenuItem(
                                //   value:
                                //       AppLocalizations.of(context).lbl_shopping,
                                //   child: Text(
                                //     AppLocalizations.of(context).lbl_shopping,
                                //   ),
                                // ),
                              ],
                              onChanged: (String? value) {
                                print('tapped');
                                formKey.currentState!.validate();
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 56,
                            width: MediaQuery.of(context).size.width - 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                if (titleController.text.isEmpty ||
                                    descriptionController.text.isEmpty ||
                                    priceController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please fill all fields'),
                                    ),
                                  );
                                  return;
                                }
                                String page = routeName.split(' ')[1];
                                TransactionType transactionType;
                                if (routeName == 'Add Expense') {
                                  page = 'Expense';
                                  transactionType = TransactionType.expense;
                                } else {
                                  page = 'Income';
                                  transactionType = TransactionType.income;
                                }

                                TransactionModel transactionModel =
                                    TransactionModel(
                                  time: DateTime.now(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  price: int.parse(priceController.text)
                                      .toString(),
                                  transactionType: transactionType,
                                  walletName: 'Wallet',
                                );

                                Box<TransactionModel> transactionDataBox =
                                    ref.watch(transactionBoxProvider)!;

                                await transactionDataBox
                                    .add(transactionModel)
                                    .then((value) async {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('$page added successfully'),
                                    ),
                                  );
                                  var x = ref.refresh(getTransactionProvider);
                                  var y = ref.refresh(totalIncomeProvider);
                                  var z = ref.refresh(totalExpenseProvider);
                                  var a = ref.refresh(totalBalanceProvider);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: const Color(0xffFCFCFC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
