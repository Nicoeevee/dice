import 'package:dice/log/domain/entities/char_item.dart';
import 'package:dice/log/domain/entities/log_item.dart';
import 'package:dice/log/domain/entities/text_info.dart';

class TextParser {
  static final RegExp _reLogItem =
      RegExp(r'<([^>]+)>([\s\S]*?)(?=\s*<|$)', multiLine: true);

  static bool check(String text) {
    return _reLogItem.hasMatch(text);
  }

  static TextInfo parse(String text) {
    final charInfo = <String, CharItem>{};
    final items = <LogItem>[];

    for (final match in _reLogItem.allMatches(text).toList()) {
      final nickname = match.group(1)!.trim();
      final message = match.group(2)!.trim();

      // 更新 charInfo
      charInfo.putIfAbsent(
        nickname,
        () => CharItem(nickname: nickname, imUserId: ''),
      );

      // 添加 LogItem
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
      exporter: 'TextPlain',
    );
  }
}

void main() {
  const testLog = '''
<阿蒙>你会让我看到什么样的表现呢？我很期待。 
<小鸟游凪>从那只叫做月仔的熊玩偶那里逃脱……不，应该说是再次复活过来，你渐渐发现恩田和过去有些不一样，他似乎变得有些冷淡，倒不是说对你的态度，而是面部表情。 
<小鸟游凪>而且事务所有关咖啡豆的开支也减少了很多，是喝腻了吗？你拿这个问小鸟游时也只是得到他说大概是吧，稍微想尝试下别的咖啡豆这样的回答。 
<小鸟游凪>不管怎么样，你通过某种手段再次回到了他的身边，这就是最好的结果了。 
<小鸟游凪>这天是个天朗气清的明媚休日，你和小鸟游乘着摇晃的电车，正在去往某个小镇的途中。 
<小鸟游凪>在那里的小镇边陲，曾经有过一座巨大的研究所。由于一名女性发起的恐怖袭击，它如今已消失得无影无踪。 
<小鸟游凪>今天正好是你和坐在对面、眺望着窗外的那个侦探相遇的第15年，三天后也就是你的生日了。 
<小鸟游凪>事情的开端是他突然说“我出个门”就起身往外走。你紧追其后，结果就是两人一起坐在了这里。不知不觉，车内已经只剩你和恩田两个人了。 
<小鸟游凪>他交叠起双手，注视着窗外的风景。 
<酒井阳向>“小鸟游在想什么呢？”#直视前方，跟着欣赏风景 
  ''';

  print(testLog);
  final textInfo = TextParser.parse(testLog);
  print(textInfo);
}
