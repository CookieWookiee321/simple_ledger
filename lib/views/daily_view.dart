import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_ledger/models/transaction_model.dart';
import 'package:simple_ledger/views/dialogs/transaction_menu_dialog.dart';
import '../controllers/daily_view_controller.dart';

class DailyViewPage extends StatefulWidget {
  final DateTime date;

  const DailyViewPage({Key? key, required this.date}) : super(key: key);

  @override
  State<DailyViewPage> createState() => _DailyViewPageState();
}

class _DailyViewPageState extends State<DailyViewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Map<int, bool> _items = {};

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
    // Offset? _globalPosition;

    // Future<void> _showContextMenu() async {
    //   double x = _globalPosition!.dx;
    //   double y = _globalPosition!.dy;

    //   await showMenu(
    //       context: context,
    //       position: RelativeRect.fromLTRB(x, y, 0, 0),
    //       items: [
    //         const PopupMenuItem(value: 0, child: Text("Update")),
    //         const PopupMenuItem(
    //           value: 1,
    //           child: Text("Delete"),
    //         )
    //       ]).then((value) {
    //     switch (value) {
    //       case 0: //update
    //         //TODO:
    //         break;
    //       case 1: // delete
    //         DailyViewController.deleteTransaction(widget.entry.id);
    //         break;
    //     }
    //   });
    // }

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
                              return TransactionListView(data: snapshot.data!);
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
class TransactionListView extends StatefulWidget {
  final List<Transaction> data;

  const TransactionListView({super.key, required this.data});

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ((context, index) {
      if (widget.data.isNotEmpty & (index < (widget.data!.length))) {
        return;
      }
    }));
    ;
  }
}

///A row which contains all information about a single transaction.
class TransactionListTile extends StatefulWidget {
  final Transaction entry;

  const TransactionListTile({Key? key, required this.entry}) : super(key: key);

  @override
  State<TransactionListTile> createState() => _TransactionListTileState();
}

class _TransactionListTileState extends State<TransactionListTile> {
  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;

    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: (widget.entry.amount! > 0.0)
                    ? const BorderSide(color: Colors.green)
                    : const BorderSide(color: Colors.red))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CheckboxListTile(
            secondary: Icon(
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
            subtitle: Text(
                (widget.entry.amount! > 0.0)
                    ? "+${widget.entry.amount}"
                    : "${widget.entry.amount}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer)),
            value: false,
            onChanged: (isChecked) {
              setState(() {
                if (isChecked!) {
                  //TODO:
                } else {}
              });
            },
          ),
        ));
  }
}
//endregion
