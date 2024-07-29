import 'package:dice/dice/domain/entities/char_item.dart';
import 'package:dice/dice/domain/entities/log_item.dart';
import 'package:dice/dice/domain/entities/text_info.dart';

class DiceKokonaLogImporter {
  static final RegExp _reEditLogTest = RegExp(
      r'^([^(<\n]+)(\(([^(\n]+)\)|\<[^(\n]+\>)?(\s+)(\d{4}-\d{1,2}-\d{1,2} )?(\d{1,2}:\d{1,2}:\d{2})( #\d+)? ?',
      multiLine: true);

  static bool check(String text) {
    return _reEditLogTest.hasMatch(text);
  }

  static String get name => 'Dice!编辑器默认格式';

  static TextInfo parse(String text) {
    final charInfo = <String, CharItem>{};
    final items = <LogItem>[];
    var currentItem = const LogItem(
        nickname: '', timeText: '', time: null, message: '', IMUserId: '');
    var lastIndex = 0;
    var startText = '';

    final reEditLog = RegExp(_reEditLogTest.pattern, multiLine: true);

    for (final match in reEditLog.allMatches(text).toList()) {
      if (currentItem.nickname.isEmpty) {
        // 处理开头部分
        startText = text.substring(lastIndex, match.start);
      } else {
        // 处理 message
        currentItem = currentItem.copyWith(
            message:
                '${currentItem.message}${text.substring(lastIndex, match.start)}'
                    .trim());
        items.add(currentItem);
      }

      // 处理新的 item
      var nickname = match.group(1)!.trim();
      var imUserId = match.group(2) != null
          ? match.group(2)!.substring(1, match.group(2)!.length - 1)
          : '';
      currentItem = LogItem(
        nickname: nickname,
        timeText: '${match.group(5) ?? ''}${match.group(6)}',
        time: _parseTime('${match.group(5) ?? ''}${match.group(6)}'),
        message: '',
        IMUserId: imUserId, // getAutoIMUserId
      );
      // 更新 charInfo
      charInfo[nickname] = CharItem(
        nickname: nickname,
        IMUserId: imUserId,
      );

      lastIndex = match.end;
    }

    // 处理最后一条消息
    if (currentItem.nickname.isNotEmpty) {
      currentItem = currentItem.copyWith(
          message: '${currentItem.message}${text.substring(lastIndex)}'.trim());
      items.add(currentItem);
    }

    return TextInfo(
        items: items,
        charInfo: charInfo,
        startText: startText,
        exporter: 'dice!');
  }

  static DateTime? _parseTime(String timeString) {
    try {
      if (timeString.contains('-')) {
        // 包含日期
        return DateTime.parse(timeString);
      } else {
        // 只包含时间
        final now = DateTime.now();
        return DateTime(
            now.year,
            now.month,
            now.day,
            int.parse(timeString.substring(0, 2)),
            int.parse(timeString.substring(3, 5)),
            int.parse(timeString.substring(6, 8)));
      }
    } catch (e) {
      return null;
    }
  }
}

void main() {
  String testLog = '''
  张三(123) 2023-04-20 10:00:00
  测试消息1
  
  李四<test> 10:01:00
  测试消息2
  ''';

  print(testLog);
  if (DiceKokonaLogImporter.check(testLog)) {
    TextInfo textInfo = DiceKokonaLogImporter.parse(testLog);

    print(textInfo.items);
  }
}
