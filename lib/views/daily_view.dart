import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_model.dart';

class _DailyViewPageState extends State<DailyViewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily View",
      home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: const Text("Daily View"),
          ),
          body: Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                //HEADING - date
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),

                //BODY
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      // TransactionRow(entry: Testing.sampleExpenseData),
                      // TransactionRow(entry: Testing.sampleIncomeData),
                    ],
                  ),
                ),

                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.zero,
                )),

                //FOOTER - "Add" button
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: FloatingActionButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const TransactionMenuDialog();
                              })
                        },
                      )),
                )
              ],
            ),
          )),
    );
  }
}

class DailyViewPage extends StatefulWidget {
  const DailyViewPage({Key? key}) : super(key: key);

  @override
  State<DailyViewPage> createState() => _DailyViewPageState();
}

//==============================================================================
// Widgets
//==============================================================================
///A row which contains all information about a single transaction.
class TransactionRow extends StatefulWidget {
  final Transaction entry;

  const TransactionRow({Key? key, required this.entry}) : super(key: key);

  @override
  State<TransactionRow> createState() => _TransactionRowState();
}

class _TransactionRowState extends State<TransactionRow> {
  @override
  Widget build(BuildContext context) {
    //for income
    if (widget.entry.amount! > 0.0) {
      return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).colorScheme.background))),
          child: InkWell(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(widget.entry.description!),
              trailing: Text("+${widget.entry.amount}"),
            ),
          )));
    }
    //for expense
    else {
      return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).colorScheme.errorContainer))),
          child: InkWell(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
                leading: Icon(
                  Icons.monetization_on,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
                title: Text(widget.entry.description!),
                trailing: Text(widget.entry.amount.toString())),
          )));
    }
  }
}

///A dialog for the user to choose which type of tranaction they want to input.
class TransactionMenuDialog extends StatefulWidget {
  const TransactionMenuDialog({super.key});

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
        content: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const StandardTransactionDialog();
                          });
                    },
                    child: const Text("Standard Transaction")),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Repeating Transaction")),
              ],
            ),
          ),
        ));
  }
}

///A dialog box for inputting a once-off transaction
class StandardTransactionDialog extends StatefulWidget {
  const StandardTransactionDialog({super.key});

  @override
  State<StandardTransactionDialog> createState() =>
      _StandardTransactionDialogState();
}

class _StandardTransactionDialogState extends State<StandardTransactionDialog> {
  late DateTime date = DateTime.now();
  late String dateStr = "${date.day}-${date.month}-${date.year}";
  late double amount;
  late String description;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101));

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Center(
          child: Text("New Transaction"),
        ),
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Date"),
              TextFormField(
                initialValue: dateStr,
                textAlign: TextAlign.center,
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0)),
                    focusColor: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ));
  }
}

//endregion
