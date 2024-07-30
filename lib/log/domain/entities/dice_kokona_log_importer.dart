import 'package:dice/log/domain/entities/char_item.dart';
import 'package:dice/log/domain/entities/log_item.dart';
import 'package:dice/log/domain/entities/text_info.dart';

class DiceKokonaLogImporter {
  static final RegExp _reEditLogTest = RegExp(
    r'^([^(<\n]+)(\(([^(\n]+)\)|\<[^(\n]+\>)?(\s+)(\d{4}-\d{1,2}-\d{1,2} )?(\d{1,2}:\d{1,2}:\d{2})( #\d+)? ?',
    multiLine: true,
  );

  static bool check(String text) {
    return _reEditLogTest.hasMatch(text);
  }

  static String get name => 'Dice!编辑器默认格式';

  static TextInfo parse(String text) {
    final charInfo = <String, CharItem>{};
    final items = <LogItem>[];
    final reEditLog = RegExp(_reEditLogTest.pattern, multiLine: true);

    var currentNickname = '';
    var currentImUserId = '';
    var currentTimeText = '';
    DateTime? currentTime;
    var currentMessage = '';

    var lastIndex = 0;
    String? startText;

    for (final match in reEditLog.allMatches(text).toList()) {
      final header = text.substring(lastIndex, match.start).trim();
      if (currentNickname.isEmpty) {
        // 处理开头部分
        startText = header.isEmpty ? null : header;
      } else {
        // 处理 message
        currentMessage += header;
        items.add(
          LogItem(
            character:
                CharItem(nickname: currentNickname, imUserId: currentImUserId),
            timeText: currentTimeText,
            time: currentTime,
            message: currentMessage.trim(),
          ),
        );
      }

      // 处理新的 item
      currentNickname = match.group(1)!.trim();
      currentImUserId = match.group(2) != null
          ? match.group(2)!.substring(1, match.group(2)!.length - 1)
          : '';
      currentTimeText = '${match.group(5) ?? ''}${match.group(6)}';
      currentTime = _parseTime(currentTimeText);
      currentMessage = '';

      // 更新 charInfo
      charInfo[currentNickname] = CharItem(
        nickname: currentNickname,
        imUserId: currentImUserId,
      );

      lastIndex = match.end;
    }

    // 处理最后一条消息
    if (currentNickname.isNotEmpty) {
      currentMessage += text.substring(lastIndex);
      items.add(
        LogItem(
          character:
              CharItem(nickname: currentNickname, imUserId: currentImUserId),
          timeText: currentTimeText,
          time: currentTime,
          message: currentMessage.trim(),
        ),
      );
    }

    return TextInfo(
      items: items,
      charInfo: charInfo,
      startText: startText,
      exporter: 'dice!',
    );
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
          int.parse(timeString.substring(6, 8)),
        );
      }
    } catch (e) {
      return null;
    }
  }
}

void main() {
  const testLog = '''
  张三(123) 2023-04-20 10:00:00
  测试消息1
  
  李四<test> 10:01:00
  测试消息2
  ''';

  print(testLog);
  if (DiceKokonaLogImporter.check(testLog)) {
    final textInfo = DiceKokonaLogImporter.parse(testLog);

    print(textInfo.items);
  }
}
