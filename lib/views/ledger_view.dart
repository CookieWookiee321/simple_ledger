import 'package:flutter/material.dart';

import '../models/ledger_model.dart';

class _LedgerPageState extends State<LedgerPage> with SingleTickerProviderStateMixin {
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
      //TODO: Make title the month name
      title: "Ledger",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        fontFamily: 'Arial'),

      home: Scaffold(
        appBar: AppBar(title: const Text("Ledger")),

        body: ListView.builder(
          itemCount: Testing.sampleLedgerData.isEmpty ? 1 : Testing.sampleLedgerData.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: const [
                    ColumnHeading(text: "Date"),
                    ColumnHeading(text: "Income"),
                    ColumnHeading(text: "Expenses"),
                    ColumnHeading(text: "Day Total")
                  ],
                ),
              );
            }
            index -= 1;

            //return row
            var rowEntry = Testing.sampleLedgerData[index];
            return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  child: Row(
                    children: [
                      ColumnText(text: rowEntry.dateShortString),
                      ColumnText(text: rowEntry.incomeTotal.toString()),
                      ColumnText(text: rowEntry.expensesTotal.toString()),
                      ColumnText(text: rowEntry.grossTotal.toString())
                    ],
                  ),
                ),
            );
          }
        )
      )
    );
  }
}

class LedgerPage extends StatefulWidget {
  const LedgerPage({Key? key}) : super(key: key);

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

//region WIDGETS

class ColumnHeading extends StatelessWidget {
  final String text;
  const ColumnHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText1));
  }
}

class ColumnText extends StatelessWidget {
  final String text;
  const ColumnText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText2));
  }
}

//endregion

