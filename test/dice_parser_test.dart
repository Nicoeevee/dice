import 'package:dice/utils/dice_parser.dart';
import 'package:flutter_test/flutter_test.dart';
// 导入前面定义的枚举和类
// ...

void main() {
  test('测试 .d100 指令', () {
    expect(CommandParser.parseCommand('.d100'), DiceCommandType.d100);
    expect(CommandParser.parseCommand('.d%'), DiceCommandType.d100);
  });

  test('测试 .d100侦查 指令', () {
    expect(CommandParser.parseCommand('.d100侦查'), DiceCommandType.d100Test);
    expect(CommandParser.parseCommand('.d100 力量'), DiceCommandType.d100Test);
  });

  test('测试 默认骰 指令', () {
    expect(CommandParser.parseCommand('.侦查'), DiceCommandType.defaultTest);
    expect(CommandParser.parseCommand('.r侦查'), DiceCommandType.defaultTest);
    expect(CommandParser.parseCommand('.d侦查'), DiceCommandType.defaultTest);
    expect(CommandParser.parseCommand('.rd侦查'), DiceCommandType.defaultTest);
  });

  test('测试 暗骰 指令', () {
    expect(CommandParser.parseCommand('.h心理学'), DiceCommandType.hiddenTest);
    expect(CommandParser.parseCommand('.rh心理学'), DiceCommandType.hiddenTest);
    expect(CommandParser.parseCommand('.rah心理学'), DiceCommandType.hiddenTest);
  });

  test('测试 对抗 指令', () {
    expect(CommandParser.parseCommand('.v力量'), DiceCommandType.versusTest);
    expect(CommandParser.parseCommand('.rv力量'), DiceCommandType.versusTest);
    expect(CommandParser.parseCommand('.rav力量'), DiceCommandType.versusTest);
  });

  test('测试 COC 理智检定 指令', () {
    expect(CommandParser.parseCommand('.sc 0/1d10'),
        DiceCommandType.cocSanityCheck);
    expect(CommandParser.parseCommand('.sc 1d6/1d20'),
        DiceCommandType.cocSanityCheck);
  });

  test('测试 COC 成长检定 指令', () {
    expect(CommandParser.parseCommand('.en'), DiceCommandType.cocGrowthCheck);
  });

  test('测试 DND 死亡豁免 指令', () {
    expect(
        CommandParser.parseCommand('.ds'), DiceCommandType.dndDeathSavingThrow);
  });

  test('测试 先攻列表 指令', () {
    expect(CommandParser.parseCommand('.ri'), DiceCommandType.initiative);
    expect(CommandParser.parseCommand('.init'), DiceCommandType.initiative);
  });

  test('测试 人物卡操作 指令', () {
    expect(CommandParser.parseCommand('.st hp+1'),
        DiceCommandType.characterCardOperation);
    expect(CommandParser.parseCommand('.st &格斗=1d3'),
        DiceCommandType.characterCardOperation);
  });

  test('测试 人物卡展示 指令', () {
    expect(CommandParser.parseCommand('.st show'),
        DiceCommandType.characterCardShow);
    expect(CommandParser.parseCommand('.st show 力量'),
        DiceCommandType.characterCardShow);
  });

  test('测试 人物卡关联 指令', () {
    expect(CommandParser.parseCommand('.nn 铃木翼'),
        DiceCommandType.characterCardLink);
  });

  test('测试 后台 Log 记录 指令', () {
    expect(CommandParser.parseCommand('.log on'), DiceCommandType.logControl);
    expect(CommandParser.parseCommand('.log off'), DiceCommandType.logControl);
  });
}
