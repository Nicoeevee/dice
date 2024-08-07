import 'dart:io';

import 'package:dashbook/dashbook.dart';
import 'package:dice/dice/presentation/pages/dice_screen.dart';
import 'package:dice/flame_jenny/commons/commons.dart';
import 'package:dice/flame_jenny/jenny.dart';
import 'package:dice/log/presentation/pages/logs_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runAsDashbook();
  // runApp(const MyApp());
}

class LogParserApp extends StatelessWidget {
  const LogParserApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LogParser',
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

class DiceParserApp extends StatelessWidget {
  const DiceParserApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceParser',
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
      home: const DiceScreen(),
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
      (_) => LogParserApp(),
      info: 'ParserApp',
    )
    ..add(
      'DiceParserApp',
      (_) => DiceParserApp(),
      info: 'DiceParserApp',
    );
  addFlameJennyExample(dashbook);
  runApp(dashbook);
}
