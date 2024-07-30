import 'dart:io';

import 'package:dice/dice/presentation/pages/logs_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: !kIsWeb || Platform.isWindows ? "微软雅黑" : null,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: !kIsWeb || Platform.isWindows ? "微软雅黑" : null,
      ),
      home: const LogsScreen(),
    );
  }
}
