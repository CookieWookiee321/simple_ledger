import 'package:flutter/material.dart';
import 'package:simple_ledger/views/dialogs/standard_transaction_dialog.dart';

///A dialog for the user to choose which type of tranaction they want to input.
class TransactionMenuDialog extends StatefulWidget {
  final DateTime date;

  const TransactionMenuDialog({super.key, required this.date});

  @override
  State<TransactionMenuDialog> createState() => _TransactionMenuDialogState();
}

class _TransactionMenuDialogState extends State<TransactionMenuDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text("Transaction Type"),
      ),
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StandardTransactionDialog(date: widget.date);
                      });
                },
                child: const Text("Standard Transaction")),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
            ElevatedButton(
                //TODO:
                onPressed: () {},
                child: const Text("Repeating Transaction")),
          ],
        ),
      ),
    );
  }
}
