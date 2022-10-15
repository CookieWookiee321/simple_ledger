import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_ledger/views/homepage_view.dart';
import 'dart:io';

import 'globals/themes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
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
      theme:
          ThemeData(useMaterial3: true, colorScheme: Styler.lightColorScheme),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: Styler.darkColorScheme),
      home: const HomePage(),
    );
  }
}
