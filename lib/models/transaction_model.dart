import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@collection
class Transaction {
  Id id = Isar.autoIncrement;
  DateTime? _date;
  double? _amount;
  String? _description;

  Transaction();
  Transaction.data(
      {required DateTime date, required double amount, String? description}) {
    _date = date;
    _amount = amount;
    _description = description;
  }

  DateTime? get date => _date;

  set date(DateTime? value) {
    _date = value;
  }

  double? get amount => _amount;

  set amount(double? value) {
    _amount = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }
}
