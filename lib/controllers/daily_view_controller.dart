import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:simple_ledger/models/profile_model.dart';
import 'package:simple_ledger/models/transaction_entry_model.dart';

import '../models/transaction_model.dart';
import '../views/daily_view.dart';

class DailyViewController extends ChangeNotifier {
  static Future<List<Transaction>> getTransactionDataForDay(
      DateTime date) async {
    final isar = Isar.getInstance("transaction_db") ??
        await Isar.open([TransactionSchema], name: "transaction_db");

    final results = isar.transactions;

    if (await results.count() > 0) {
      final filtered = await results
          .filter()
          .dateGreaterThan(DateTime(date.year, date.month, date.day, 0, 0, 0))
          .and()
          .dateLessThan(DateTime(date.year, date.month, date.day, 23, 59, 59))
          .findAll();

      filtered.toList().sort(((b, a) {
        return a.date!.compareTo(b.date!);
      }));

      return filtered;
    }
    final Future<List<Transaction>> ret = [] as Future<List<Transaction>>;
    return ret;
  }

  static Future<void> saveTransaction(Transaction transaction) async {
    assert(transaction.amount != null || transaction.date != null,
        "Amount and date must be initialized");

    final isar = Isar.getInstance("transaction_db") ??
        await Isar.open([TransactionSchema], name: "transaction_db");

    await isar.writeTxn(() async {
      final num = await isar.transactions.put(transaction);
      print("Submitted #$num items");
    });
  }

  static Future<List<TransactionEntry>?> getTransactionsFromDate() async {
    return await null;
  }

  static Future<List<TransactionEntry>?> getTransactionsFromAmount(
      double amount) async {
    return await null;
  }

  static Future<List<TransactionEntry>?> getTransactionsFromDescription(
      String description) async {
    return await null;
  }
}
