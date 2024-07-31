import 'package:dice/log/domain/entities/char_item.dart';
import 'package:dice/log/domain/entities/log_item.dart';
import 'package:dice/log/domain/entities/text_info.dart';

class SealDocParser {
  static final RegExp _reLogItem = RegExp(r'^<(.*?)>:?(.*)$', multiLine: true);

  static bool check(String text) {
    return _reLogItem.hasMatch(text);
  }

  static TextInfo parse(String text) {
    final charInfo = <String, CharItem>{};
    final items = <LogItem>[];

    for (final match in _reLogItem.allMatches(text).toList()) {
      final nickname = match.group(1)!.trim();
      final message = match.group(2)!.trim();

      charInfo.putIfAbsent(
        nickname,
        () => CharItem(nickname: nickname, imUserId: ''),
      );

      items.add(
        LogItem(
          character: charInfo[nickname]!,
          message: message,
          timeText: '',
        ),
      );
    }

    return TextInfo(
      items: items,
      charInfo: charInfo,
      exporter: 'Seal',
    );
  }
}
