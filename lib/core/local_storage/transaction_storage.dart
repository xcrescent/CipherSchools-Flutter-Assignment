import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/add_expense_income/model/transaction_model.dart';

class TransactionStorage {
  Box<TransactionModel>? incomeExpenseBox;

  TransactionStorage(this.incomeExpenseBox);

  // Future<void> init({isTest = false}) async {
  //   expenseBox = expenseBox ??
  //       await Hive.openBox(
  //         'expense_data',
  //         bytes: isTest ? Uint8List(0) : null,
  //       );
  // }

  Future<List<TransactionModel>?> get() async {
    var x = incomeExpenseBox?.values.toList();
    if (kDebugMode) {
      print(x);
    }

    return incomeExpenseBox?.values.toList().cast<TransactionModel>();
  }

  // Future<void> put({
  //   required String key,
  //   required String value,
  // }) async {
  //   await expenseBox?.put(key, value);
  // }
}
