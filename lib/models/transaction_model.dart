import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class TransactionModel {
  TransactionModel({required this.date, required this.amount, this.description = ""});

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String description;
}

class Testing {
  static final sampleExpenseData = TransactionModel(date: DateTime.now(), amount: -50);
  static final sampleIncomeData = TransactionModel(date: DateTime.now(), amount: 100);
}