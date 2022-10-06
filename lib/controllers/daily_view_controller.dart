import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:simple_ledger/models/transaction_model.dart';

class DailyViewController extends ChangeNotifier {
  static Future<void> addTransaction(TransactionModel transaction) async {
    var transactionsBox = await Hive.openBox<TransactionModel>('transaction');
    transactionsBox.add(transaction);
  }

  static Future<List<TransactionModel>> getTransactionsFromDate(DateTime date) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionModel> toReturn = <TransactionModel>[];

    for (TransactionModel t in transactionsBox.values) {
      if (t.date == date) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }

  static Future<List<TransactionModel>> getTransactionsFromAmount(double amount) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionModel> toReturn = <TransactionModel>[];

    for (TransactionModel t in transactionsBox.values) {
      if (t.amount == amount) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }

  static Future<List<TransactionModel>> getTransactionsFromDescription(String description) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionModel> toReturn = <TransactionModel>[];

    for (TransactionModel t in transactionsBox.values) {
      if (t.description == description) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }
}