import 'package:hive_flutter/hive_flutter.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String price;
  @HiveField(3)
  String time;

  ExpenseModel({
    required this.title,
    required this.description,
    required this.price,
    required this.time,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      title: map['title'],
      description: map['description'],
      price: map['price'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'time': time,
    };
  }
}
