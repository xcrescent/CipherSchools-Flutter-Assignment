import 'package:hive_flutter/hive_flutter.dart';

part 'income_model.g.dart';

@HiveType(typeId: 0)
class IncomeModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String price;
  @HiveField(3)
  String time;

  IncomeModel({
    required this.title,
    required this.description,
    required this.price,
    required this.time,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
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
