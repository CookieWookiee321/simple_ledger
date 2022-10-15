import 'package:flutter/widgets.dart';
import 'package:simple_ledger/models/transaction_model.dart';

class DailyViewController extends ChangeNotifier {
  static Future<void> addTransaction(Transaction transaction) async {}

  static Future<List<Transaction>?> getTransactionsFromDate() async {
    return await null;
  }

  static Future<List<Transaction>?> getTransactionsFromAmount(
      double amount) async {
    return await null;
  }

  static Future<List<Transaction>?> getTransactionsFromDescription(
      String description) async {
    return await null;
  }
}
