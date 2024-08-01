import 'dart:io';

import 'package:dashbook/dashbook.dart';
import 'package:dice/flame_jenny/commons/commons.dart';
import 'package:dice/flame_jenny/jenny.dart';
import 'package:dice/log/presentation/pages/logs_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runAsDashbook();
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: kIsWeb
            ? null
            : Platform.isWindows
                ? '微软雅黑'
                : null,
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: kIsWeb
            ? null
            : Platform.isWindows
                ? '微软雅黑'
                : null,
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      home: const LogsScreen(),
    );
  }
}

void runAsDashbook() {
  final dashbook = Dashbook(
    title: 'Flame Examples',
    theme: ThemeData.dark(),
  );

  dashbook.storiesOf('Parser')
    ..add(
      'ParserApp',
      (_) => MyApp(),
      info: 'ParserApp',
    );
  addFlameJennyExample(dashbook);
  runApp(dashbook);
}
