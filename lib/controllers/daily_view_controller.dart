import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:simple_ledger/models/transaction_model.dart';

class DailyViewController extends ChangeNotifier {
  static Future<void> addTransaction(TransactionEntry transaction) async {
    var transactionsBox = await Hive.openBox<TransactionEntry>('transaction');
    transactionsBox.add(transaction);
  }

  static Future<List<TransactionEntry>> getTransactionsFromDate(DateTime date) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionEntry> toReturn = <TransactionEntry>[];

    for (TransactionEntry t in transactionsBox.values) {
      if (t.date == date) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }

  static Future<List<TransactionEntry>> getTransactionsFromAmount(double amount) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionEntry> toReturn = <TransactionEntry>[];

    for (TransactionEntry t in transactionsBox.values) {
      if (t.amount == amount) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }

  static Future<List<TransactionEntry>> getTransactionsFromDescription(String description) async {
    var transactionsBox = await Hive.openBox('transactions');
    List<TransactionEntry> toReturn = <TransactionEntry>[];

    for (TransactionEntry t in transactionsBox.values) {
      if (t.description == description) {
        toReturn.add(t);
      }
    }

    return toReturn;
  }
}