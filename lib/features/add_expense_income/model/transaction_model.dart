import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String price;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  TransactionType transactionType;
  @HiveField(5)
  String walletName;

  TransactionModel({
    required this.title,
    required this.description,
    required this.price,
    required this.time,
    required this.transactionType,
    required this.walletName,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      title: map['title'],
      description: map['description'],
      price: map['price'],
      time: map['time'],
      transactionType: map['transactionType'],
      walletName: map['walletName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'time': time,
      'transactionType': transactionType,
      'walletName': walletName,
    };
  }
}
