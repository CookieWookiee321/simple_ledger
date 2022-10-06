import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:simple_ledger/models/transaction_model.dart';

@HiveType(typeId: 4)
class LedgerEntry {
  LedgerEntry({required this.date, required this.transactionList});

  @HiveField(0)
  DateTime date;

  @HiveField(1)
  List<TransactionModel> transactionList;

  String get dateShortString {
    var format = DateFormat('dd');
    return format.format(date);
  }

  double get grossTotal {
    var ret = 0.0;

    for (var e in transactionList) {
      ret += e.amount;
    }

    return ret;
  }

  double get expensesTotal {
    var ret = 0.0;

    for (var e in transactionList) {
      if (e.amount < 0.0) {
        ret += e.amount;
      }
    }

    return ret;
  }

  double get incomeTotal {
    var ret = 0.0;

    for (var e in transactionList) {
      if (e.amount > 0.0) {
        ret += e.amount;
      }
    }

    return ret;
  }
}

class Testing {
  static final sampleLedgerData = List<LedgerEntry>.filled(
      30,
      LedgerEntry(
          date: DateTime.now(),
          transactionList:
              List<TransactionModel>.filled(1, TransactionModel(date: DateTime.now(), amount: 150))
      )
  );
}
