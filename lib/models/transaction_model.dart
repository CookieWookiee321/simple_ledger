import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class TransactionEntry {
  TransactionEntry({required this.date, required this.amount, this.description = "Transaction"});

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String description;
}

class Testing {
  static final sampleExpenseData = TransactionEntry(date: DateTime.now(), amount: -50);
  static final sampleIncomeData = TransactionEntry(date: DateTime.now(), amount: 100);
}