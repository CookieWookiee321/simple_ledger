import 'package:flutter/material.dart';
import 'package:simple_ledger/views/daily_view.dart';
import 'package:simple_ledger/views/ledger_view.dart';

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Ledger",

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Ledger"),
        ),

        //BODY
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //PROFILE BUTTON
                OutlinedButton(
                  onPressed: () => {
                    //TODO:
                  },
                  child: const Text("Profile"),
                ),

                Padding(padding: EdgeInsets.all(13.0)),

                //LEDGER BUTTON
                ElevatedButton.icon(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const LedgerPage();
                          }))
                    },
                    icon: const Icon(
                      Icons.account_balance,
                    ),
                    label: const Text("Ledger Mode")),

                Padding(padding: EdgeInsets.all(13.0)),

                //DETAILS BUTTON
                ElevatedButton.icon(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const DailyViewPage();
                          }))
                    },
                    icon: const Icon(
                      Icons.account_balance_wallet,
                    ),
                    label: const Text("Daily Mode")),
              ]),
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}
