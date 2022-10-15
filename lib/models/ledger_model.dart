import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:simple_ledger/models/transaction_model.dart';

part 'ledger_model.g.dart';

@collection
class LedgerEntry {
  Id id = Isar.autoIncrement;
  double? amount;
  List<Transaction>? transactions;

  LedgerEntry();
  LedgerEntry.withData(this.amount, List<Transaction>? transactions);

  // String get dateShortString {
  //   var format = DateFormat('dd');
  //   return date != null ? format.format(date!) : "[Date not initialized]";
  // }

  // double get grossTotal {
  //   if (transactionList == null || transactionList!.isEmpty) return 0;

  //   var ret = 0.0;

  //   for (var e in transactionList!) {
  //     ret += e.amount!;
  //   }

  //   return ret;
  // }

  // @embedded
  // double get expensesTotal {
  //   if (transactionList == null || transactionList!.isEmpty) return 0;
  //   var ret = 0.0;

  //   for (var e in transactionList!) {
  //     if (e.amount! < 0.0) {
  //       ret += e.amount!;
  //     }
  //   }

  //   return ret;
  // }

  // double get incomeTotal {
  //   if (transactionList == null || transactionList!.isEmpty) return 0;
  //   var ret = 0.0;

  //   for (var e in transactionList!) {
  //     if (e.amount! > 0.0) {
  //       ret += e.amount!;
  //     }
  //   }

  //   return ret;
  // }
}
