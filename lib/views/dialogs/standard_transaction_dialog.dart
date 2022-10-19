import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_ledger/controllers/daily_view_controller.dart';
import 'package:simple_ledger/models/transaction_model.dart';

///A dialog box for inputting a once-off transaction
class StandardTransactionDialog extends StatefulWidget {
  final DateTime date;

  const StandardTransactionDialog({super.key, required this.date});

  @override
  State<StandardTransactionDialog> createState() =>
      _StandardTransactionDialogState();
}

class _StandardTransactionDialogState extends State<StandardTransactionDialog> {
  late DateTime _date = widget.date;
  late String _dateStr = DateFormat.yMMMMd().format(_date);
  double _amount = 0.0;
  String? _description;
  final _amountController = TextEditingController(text: "0.0");
  late final _dateTextController = TextEditingController(text: _dateStr);

  Color _colorActive = Colors.green;
  final _colorIncome = Colors.green;
  final _colorExpense = Colors.red;

  String _typeSelection = "Income";
  final List<DropdownMenuItem<String>> _typeOptions = [
    const DropdownMenuItem(
      value: "Income",
      child: Text("Income"),
    ),
    const DropdownMenuItem(
      value: "Expense",
      child: Text("Expense"),
    )
  ];

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101));

    if (picked != null && picked != _date) {
      _date = picked;

      _dateStr = DateFormat.yMMMMd().format(_date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Center(
          child: Text("New Transaction"),
        ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(width: 2.0, color: _colorActive)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 1.0, 8.0, 1.0),
                      child: DropdownButton(
                          value: _typeSelection,
                          items: _typeOptions,
                          onChanged: (value) {
                            setState(() {
                              _typeSelection = value.toString();
                              _typeSelection == "Income"
                                  ? _colorActive = _colorIncome
                                  : _colorActive = _colorExpense;
                            });
                          }),
                    )),
                const Text("Date"),
                TextFormField(
                  readOnly: true,
                  controller: _dateTextController,
                  textAlign: TextAlign.center,
                  onTap: () async {
                    await _selectDate(context);
                    _dateTextController.text = _dateStr;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      focusColor: Theme.of(context).colorScheme.primary),
                ),
                const Text("Amount"),
                TextFormField(
                  controller: _amountController,
                  onTap: () {
                    _amountController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: (_amountController.text.length));
                  },
                  onChanged: (value) {
                    if (_amountController.text.isNotEmpty) {
                      if (_amountController.text.contains("-")) {
                        _amountController.text = _amountController.text
                            .substring(
                                0, (_amountController.text.indexOf("-") - 1));
                      }
                      _amount = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      focusColor: Theme.of(context).colorScheme.primary),
                ),
                const Text("Description"),
                TextFormField(
                  onTap: () {
                    _amountController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: (_amountController.text.length));
                  },
                  onChanged: (value) {
                    _description = value;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      focusColor: Theme.of(context).colorScheme.primary),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0)),
                ElevatedButton(
                    onPressed: () async {
                      if (_amount != 0.0) {
                        final t = Transaction();
                        t.date = _date;
                        t.amount = _typeSelection == "Expense"
                            ? _amount *= -1
                            : _amount;
                        t.description = _description;

                        await DailyViewController.saveTransaction(t);

                        if (mounted) {
                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Amount cannot be 0"),
                        ));
                      }
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
