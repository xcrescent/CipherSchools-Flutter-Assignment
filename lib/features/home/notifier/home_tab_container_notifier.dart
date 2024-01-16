import 'package:assignment/features/add_expense_income/model/transaction_model.dart';
import 'package:assignment/features/home/models/home_tab_container_model.dart';
import 'package:assignment/features/home/models/selection_popup_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_tab_container_state.dart';

final homeTabContainerNotifier =
    StateNotifierProvider<HomeTabContainerNotifier, HomeTabContainerState>(
        (ref) {
  return HomeTabContainerNotifier(
    HomeTabContainerState(
      selectedDropDownValue: SelectionPopupModel(title: ''),
      homeTabContainerModelObj: HomeTabContainerModel(
        dropdownItemList: [
          SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
          SelectionPopupModel(id: 2, title: "Item Two"),
          SelectionPopupModel(id: 3, title: "Item Three")
        ],
        incomeComponentItemList: [],
      ),
    ),
  );
});

/// A notifier that manages the state of a HomeTabContainer according to the event that is dispatched to it.
class HomeTabContainerNotifier extends StateNotifier<HomeTabContainerState> {
  HomeTabContainerNotifier(HomeTabContainerState state) : super(state);

  void onSelected(value) {
    state = state.copyWith(
      selectedDropDownValue: value,
    );
  }
}

final totalExpenseProvider = FutureProvider<double>((ref) async {
  List<TransactionModel>? data =
      Hive.box<TransactionModel>('transaction_data').values.toList();
  double totalExpense = 0;
  for (var element in data) {
    if (element.transactionType == TransactionType.expense) {
      totalExpense += double.parse(element.price.replaceAll("₹", ""));
    }
  }
  return totalExpense;
});
final totalBalanceProvider = FutureProvider<double>((ref) async {
  List<TransactionModel>? data =
      Hive.box<TransactionModel>('transaction_data').values.toList();
  double totalBalance = 0;
  for (var element in data) {
    if (element.transactionType == TransactionType.income) {
      totalBalance += double.parse(element.price);
    } else {
      totalBalance -= double.parse(element.price);
    }
  }
  return totalBalance;
});

//
//
final totalIncomeProvider = FutureProvider<double>((ref) async {
  List<TransactionModel>? data =
      Hive.box<TransactionModel>('transaction_data').values.toList();
  double totalIncome = 0;
  for (var element in data) {
    if (element.transactionType == TransactionType.income) {
      totalIncome += double.parse(element.price.replaceAll("₹", ""));
    }
  }
  return totalIncome;
});
//
// final totalIncomeProvider = FutureProvider<double>((ref) async {
//   // Watch the getTransactionProvider future and rebuild when it changes
//   final transactionsAsyncValue =
//       Hive.box<TransactionModel>('transaction_data').watch(
//     key: 'transaction_data',
//   );
//
//
//   // Calculating the total balance based on completed transactions
//   return transactionsAsyncValue.when(
//     data: (transactions) {
//       print(transactions);
//       double totalBalance = 0;
//       for (var transaction in transactions!) {
//         if (transaction.transactionType == TransactionType.income) {
//           totalBalance += double.parse(transaction.price.replaceAll("₹", ""));
//         } else {
//           totalBalance -= double.parse(transaction.price.replaceAll("₹", ""));
//         }
//       }
//       return totalBalance;
//     },
//     loading: () => 0, // Return a default value or throw an error if appropriate
//     error: (e, stack) => throw e, // Rethrow the error or handle it accordingly
//   );
// });

// final totalBalancePod = NotifierProvider<double>((ref) {
//   return
// });
