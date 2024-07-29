import 'package:dice/dice/domain/entities/DiceKokonaLogImporter.dart';
import 'package:dice/dice/domain/entities/text_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogsScreen extends StatefulWidget {
  const LogsScreen({super.key});

  @override
  State<LogsScreen> createState() => _LogsScreenState();
}

class _LogsScreenState extends State<LogsScreen> {
  static const String content = '''
张三(123) 2023-04-20 10:00:00
测试消息1

李四<test> 10:01:00
测试消息2''';
  final TextEditingController _textEditingController =
      TextEditingController(text: content);
  TextInfo? textInfo;

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
    setState(() {
      if (DiceKokonaLogImporter.check(_textEditingController.text)) {
        textInfo = DiceKokonaLogImporter.parse(_textEditingController.text);
      } else {
        textInfo = null;
      }
    });
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: TextField(
                        controller: _textEditingController,
                        maxLines: null,
                        onChanged: (text) => _parseLogs(),
                        decoration: InputDecoration(
                          hintText: '输入日志内容',
                          filled: true, // 填充背景颜色
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // 设置圆角
                            borderSide: BorderSide.none, // 移除边框
                          ),
                          contentPadding: const EdgeInsets.all(16.0), // 设置内边距
                        ),
                      ),
                    ),
                    Card.outlined(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('人数'),
                        subtitle: Text('${textInfo?.charInfo.length}'),
                      ),
                    ),
                    const Divider(),
                    Card.outlined(
                      child: ListTile(
                        leading: const Icon(Icons.notes),
                        title: const Text('Start Text'),
                        subtitle: Text('${textInfo?.startText}'),
                        isThreeLine: true,
                      ),
                    ),
                    Card.outlined(
                      child: ListTile(
                        leading: const Icon(Icons.notes),
                        title: const Text('Exporter'),
                        subtitle: Text('${textInfo?.exporter}'),
                        isThreeLine: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse
              }),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: textInfo?.items.length ?? 0,
                itemBuilder: (context, index) {
                  final item = textInfo!.items[index];
                  return MessageBubble(
                    message: item.message,
                    isUserMe: item.nickname == '张三', // 判断是否是当前用户
                    userName: item.nickname, // 显示用户名
                    time: item.time,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUserMe;
  final String userName;
  final DateTime? time;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isUserMe,
    required this.userName,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isUserMe
        ? colorScheme.onTertiaryContainer
        : colorScheme.onPrimaryContainer;
    final messageBubble = Card.filled(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: isUserMe
          ? colorScheme.tertiaryContainer
          : colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                userName,
                style: textTheme.titleLarge?.copyWith(
                  color: textColor,
                ),
              ),
            ),
            // if (time != null)
            //   Text(
            //     DateFormat.yMMMMEEEEd().format(time!),
            //     style: textTheme.bodyMedium?.copyWith(
            //       color: textColor,
            //     ),
            //   ),
            Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );

    return Row(
      mainAxisAlignment:
          isUserMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUserMe) const SizedBox(width: 16.0),
        messageBubble,
        if (isUserMe) const SizedBox(width: 16.0),
      ],
    );
  }
}
