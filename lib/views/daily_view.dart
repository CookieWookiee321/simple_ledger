import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_ledger/controllers/daily_view_controller.dart';
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
      title: "Daily Transactions",
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          fontFamily: 'Arial'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Daily Transactions"),
        ),
        body: Column(
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
                  TransactionRow(entry: Testing.sampleExpenseData),
                  TransactionRow(entry: Testing.sampleIncomeData),
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
                    child: Icon(
                      Icons.add_circle,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () => {
                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("New Transaction"),
                              content: Padding(padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text("Date"),
                                  TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.0)
                                    ),
                                      focusColor: Theme.of(context).colorScheme.primary
                                  ),
                                  ),
                                ],
                              ),),
                            );
                          })
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class DailyViewPage extends StatefulWidget {
  const DailyViewPage({Key? key}) : super(key: key);

  @override
  State<DailyViewPage> createState() => _DailyViewPageState();
}

//region WIDGETS

class _TransactionRowState extends State<TransactionRow> {
  @override
  Widget build(BuildContext context) {
    //for income
    if (widget.entry.amount > 0.0) {
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
              title: Text(widget.entry.description),
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
                title: Text(widget.entry.description),
                trailing: Text(widget.entry.amount.toString())),
          )));
    }
  }
}

class TransactionRow extends StatefulWidget {
  final TransactionEntry entry;
  const TransactionRow({Key? key, required TransactionEntry this.entry})
      : super(key: key);

  @override
  State<TransactionRow> createState() => _TransactionRowState();
}

//endregion
