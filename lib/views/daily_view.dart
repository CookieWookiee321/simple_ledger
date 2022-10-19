import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_ledger/models/transaction_model.dart';
import 'package:simple_ledger/views/dialogs/transaction_menu_dialog.dart';
import '../controllers/daily_view_controller.dart';
import '../models/transaction_entry_model.dart';

class DailyViewPage extends StatefulWidget {
  final DateTime date;

  const DailyViewPage({Key? key, required this.date}) : super(key: key);

  @override
  State<DailyViewPage> createState() => _DailyViewPageState();
}

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
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("Daily View"),
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DailyViewPage(
                    date: widget.date.subtract(const Duration(days: 1)));
              }));
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DailyViewPage(
                    date: widget.date.add(const Duration(days: 1)));
              }));
            }
          },
          child: Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                //HEADING - date
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      DateFormat.yMMMMd().format(widget.date),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),

                //BODY
                Expanded(
                    child: FutureBuilder(
                        future: DailyViewController.getTransactionDataForDay(
                            widget.date),
                        builder: ((BuildContext context,
                            AsyncSnapshot<List<Transaction>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView(
                                children: [
                                  ...snapshot.data!.map((e) {
                                    return TransactionRow(
                                      entry: e,
                                    );
                                  })
                                ],
                              );
                            }
                          }
                          return const CircularProgressIndicator();
                        }))),

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
                                return TransactionMenuDialog(date: widget.date);
                              }).then((value) async {
                            await DailyViewController.getTransactionDataForDay(
                                widget.date);
                            setState(() {});
                          })
                        },
                      )),
                )
              ],
            ),
          ),
        ));
  }
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
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: (widget.entry.amount! > 0.0)
                    ? const BorderSide(color: Colors.green)
                    : const BorderSide(color: Colors.red))),
        child: InkWell(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: (widget.entry.amount! > 0) ? Colors.green : Colors.red,
            ),
            title: widget.entry.description != null
                ? Text(
                    widget.entry.description!,
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  )
                : (widget.entry.amount! > 0)
                    ? const Text(
                        "Income",
                        style: TextStyle(color: Colors.grey),
                      )
                    : const Text(
                        "Expense",
                        style: TextStyle(color: Colors.grey),
                      ),
            trailing: Text(
                (widget.entry.amount! > 0.0)
                    ? "+${widget.entry.amount}"
                    : "${widget.entry.amount}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary)),
          ),
        )));
  }
}
//endregion
