import 'package:assignment/core/local_storage/transaction_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/add_expense_income/model/transaction_model.dart';

final transactionStorageProvider = Provider.autoDispose<TransactionStorage>(
  (ref) => TransactionStorage(ref.watch(transactionBoxProvider)),
  name: 'expenseStorageProvider',
);

final transactionBoxProvider = Provider.autoDispose<Box<TransactionModel>?>(
  (ref) => Hive.box<TransactionModel>('transaction_data'),
  name: 'transactionBoxProvider',
);

final getTransactionProvider =
    FutureProvider.autoDispose<List<TransactionModel>?>(
  (ref) async {
    final transactionStorage = ref.watch(transactionStorageProvider);

    return transactionStorage.get();
  },
  name: 'getTransactionProvider',
);
