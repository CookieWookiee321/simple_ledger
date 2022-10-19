import 'package:isar/isar.dart';

part 'transaction_entry_model.g.dart';

@embedded
class TransactionEntry {
  DateTime? _date;
  int? _amount;
  String? _description;

  TransactionEntry();

  DateTime? get date => _date;

  set date(DateTime? value) {
    _date = value;
  }

  int? get amount => _amount;

  set amount(int? value) {
    _amount = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }
}
