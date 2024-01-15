import 'package:assignment/features/add_expense_income/model/expense_model.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../l10n/l10n.dart';
import '../model/income_model.dart';

@RoutePage(
  deferredLoading: true,
)
class AddExpenseIncomePage extends StatelessWidget {
  const AddExpenseIncomePage(
      {super.key, required this.color, required this.routeName});

  final Color color;

  final String routeName;

  static TextEditingController titleController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    controller: priceController,
                    style: TextStyle(
                      color: const Color(0xffFCFCFC),
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    cursorColor: const Color(0xffFCFCFC),
                    decoration: InputDecoration(
                      hintText: '0',
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
                          height: 56,
                          width: MediaQuery.of(context).size.width - 60,
                          child: DropdownButtonFormField(
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
                            items: [
                              DropdownMenuItem(
                                value: AppLocalizations.of(context)
                                    .lbl_subscription,
                                child: Text(
                                  AppLocalizations.of(context).lbl_subscription,
                                ),
                              ),
                              DropdownMenuItem(
                                value: AppLocalizations.of(context).lbl_food,
                                child: Text(
                                  AppLocalizations.of(context).lbl_food,
                                ),
                              ),
                              DropdownMenuItem(
                                value: AppLocalizations.of(context).lbl_travel,
                                child: Text(
                                  AppLocalizations.of(context).lbl_travel,
                                ),
                              ),
                              DropdownMenuItem(
                                value:
                                    AppLocalizations.of(context).lbl_shopping,
                                child: Text(
                                  AppLocalizations.of(context).lbl_shopping,
                                ),
                              ),
                            ],
                            onChanged: (String? value) {
                              titleController.text = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 56,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFF1F1FA),
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            controller: descriptionController,
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
                                value: AppLocalizations.of(context).lbl_wallet,
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
                            onChanged: (String? value) {},
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
                              backgroundColor: const Color(0xFF7F3DFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
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
                              if (routeName == 'Add Expense') {
                                ExpenseModel expenseModel = ExpenseModel(
                                  time: DateTime.now().toString(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  price: priceController.text,
                                );

                                Box<ExpenseModel> expenseDataBox;
                                if (Hive.isBoxOpen('expense_data')) {
                                  expenseDataBox =
                                      Hive.box<ExpenseModel>('expense_data');
                                } else {
                                  expenseDataBox =
                                      await Hive.openBox<ExpenseModel>(
                                          'expense_data');
                                }

                                await expenseDataBox.add(expenseModel).then(
                                      (value) => Navigator.pop(context),
                                    );
                              } else {
                                IncomeModel incomeModel = IncomeModel(
                                  time: DateTime.now().toString(),
                                  title: '',
                                  description: '',
                                  price: '',
                                );

                                Box<IncomeModel> incomeDataBox;
                                if (Hive.isBoxOpen('income_data')) {
                                  incomeDataBox =
                                      Hive.box<IncomeModel>('income_data');
                                } else {
                                  incomeDataBox =
                                      await Hive.openBox<IncomeModel>(
                                          'income_data');
                                }

                                await incomeDataBox.add(incomeModel).then(
                                      (value) => Navigator.pop(context),
                                    );
                              }
                            },
                            child: const Text('Continue'),
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
    );
  }
}
