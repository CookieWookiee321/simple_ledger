import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@embedded
class Transaction {
  DateTime? _date;
  int? _amount;
  String? _description;

  Transaction();

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
