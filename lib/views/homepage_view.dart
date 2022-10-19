import 'package:flutter/material.dart';
import 'package:simple_ledger/views/daily_view.dart';
import 'package:simple_ledger/views/ledger_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Ledger",
      home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Simple Ledger"),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),

          //BODY
          body: Center(
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.background,
                      border: Border.all(
                          width: 6.0,
                          color:
                              Theme.of(context).colorScheme.primaryContainer)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //PROFILE BUTTON
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer)),
                              onPressed: () {},
                              child: Text("Profile")),

                          const Padding(padding: EdgeInsets.all(13.0)),

                          //MONTHLY VIEW
                          ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.primary),
                                  foregroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.onPrimary)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return const LedgerPage();
                                })));
                              },
                              icon: Icon(Icons.account_balance,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              label: const Text("Monthly View")),

                          //DAILY VIEW
                          ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.primary),
                                  foregroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.onPrimary)),
                              onPressed: () => {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DailyViewPage(
                                          date: DateTime.now());
                                    }))
                                  },
                              icon: const Icon(
                                Icons.account_balance_wallet,
                              ),
                              label: const Text("Daily View")),
                        ]),
                  )))),
    );
  }
}

class _LedgerElevatedButton extends StatelessWidget {
  final Widget label;
  final IconData? icon;
  final Function()? onPressed;

  const _LedgerElevatedButton(
      {super.key, required this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.primary),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.onPrimary)),
          onPressed: onPressed,
          icon: Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
          label: label);
    }
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onPrimary)),
        onPressed: onPressed,
        child: label);
  }
}
