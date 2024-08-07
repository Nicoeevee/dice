import 'dart:ui';

import 'package:dice/dice/presentation/widgets/copyable_dice_command.dart';
import 'package:dice/utils/dice_parser.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: '.d100');

  DiceCommandType? commandType;

  @override
  void initState() {
    super.initState();
    _parseDice();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _parseDice() {
    commandType =
        CommandParser.parseCommand(_textEditingController.text.trim());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Parser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card.outlined(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '$commandType',
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _textEditingController,
                        selectionHeightStyle: BoxHeightStyle.strut,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        onChanged: (text) => _parseDice(),
                        decoration: InputDecoration(
                          hintText: '输入骰子指令',
                          filled: true, // 填充背景颜色
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20), // 设置圆角
                            borderSide: BorderSide.none, // 移除边框
                          ),
                          contentPadding: const EdgeInsets.all(16), // 设置内边距
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SingleChildScrollView(child: CommandTable())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
