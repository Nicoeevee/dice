import 'dart:ui';

import 'package:dice/log/domain/entities/char_item.dart';
import 'package:dice/log/domain/entities/dice_kokona_log_importer.dart';
import 'package:dice/log/domain/entities/seal_doc_parser.dart';
import 'package:dice/log/domain/entities/text_info.dart';
import 'package:dice/log/presentation/widgets/message_list_item.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  static const String content = '''
--
title: 标题在这里
--  

张三(123) 2023-04-20 10:00:00
测试消息1

李四<test> 10:01:00
测试消息2''';
  final TextEditingController _textEditingController =
      TextEditingController(text: content);
  TextInfo? textInfo;
  CharItem? me;

  @override
  void initState() {
    super.initState();
    _parseLogs();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _parseLogs() {
    if (DiceKokonaLogImporter.check(_textEditingController.text)) {
      textInfo = DiceKokonaLogImporter.parse(_textEditingController.text);
    } else if (SealDocParser.check(_textEditingController.text)) {
      textInfo = SealDocParser.parse(_textEditingController.text);
    } else {
      textInfo = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _textEditingController,
                  selectionHeightStyle: BoxHeightStyle.strut,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  onChanged: (text) => _parseLogs(),
                  decoration: InputDecoration(
                    hintText: '输入日志内容',
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
          ),
          const VerticalDivider(),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Symbols.group),
                      title: const Text('人数'),
                      subtitle: Text('${textInfo?.charInfo.length}'),
                    ),
                    const Divider(),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: textInfo?.charInfo.length,
                          itemBuilder: (context, index) {
                            final item =
                                textInfo?.charInfo.entries.elementAt(index);
                            final character = item?.value;
                            return CheckboxListTile(
                              secondary: CircleAvatar(
                                child: Text(
                                  '${character?.nickname.characters.take(2)}',
                                ),
                              ),
                              title: Text('${character?.nickname}'),
                              subtitle: Text('${character?.imUserId}'),
                              onChanged: (value) {
                                setState(() {
                                  if (value == false) {
                                    me = null;
                                    return;
                                  }
                                  me = character;
                                });
                              },
                              selected: me == character,
                              value: me == character,
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(),
                    if (textInfo?.startText != null)
                      ListTile(
                        leading: const Icon(Symbols.notes),
                        title: const Text('Start Text'),
                        subtitle: Text('${textInfo?.startText}'),
                        isThreeLine: true,
                      ),
                    ListTile(
                      leading: const Icon(Symbols.export_notes),
                      title: const Text('Exporter'),
                      subtitle: Text('${textInfo?.exporter}'),
                      isThreeLine: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: SelectionArea(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  itemCount: textInfo?.items.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = textInfo!.items[index];
                    final character = item.character;
                    return MessageBubble(
                      message: item.message,
                      isUserMe: character == me, // 判断是否是当前用户
                      userName: character.nickname, // 显示用户名
                      time: item.time,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
