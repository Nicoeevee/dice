enum DiceCommandType {
  d100, // .d100 / .d%
  d100Test, // .d100侦查
  defaultTest, // .侦查 / .r侦查 / .d侦查 / .rd侦查
  hiddenTest, // .h心理学 / .rh心理学 / .rah心理学
  versusTest, // .v力量 / .rv力量 / .rav力量
  cocSanityCheck, // .sc 0/1d10
  cocGrowthCheck, // .en
  dndDeathSavingThrow, // .ds
  initiative, // .ri / .init
  characterCardOperation, // .st hp+1 / .st &格斗=1d3
  characterCardShow, // .st show / .st show 力量
  characterCardLink, // .nn铃木翼
  logControl, // .log on / .log off
  unknown, // 未知指令
}

class CommandParser {
  static RegExp d100Regex = RegExp(r'^\.d(100|%)$'); // 匹配 .d100 或 .d%

  static RegExp d100TestRegex = RegExp(r'^\.d100(.+)'); // 匹配 .d100 后跟任意字符，用于检定

  static RegExp defaultTestRegex =
      RegExp(r'^\.(r?d?)?(.+)'); // 匹配 .侦查、.r侦查、.d侦查、.rd侦查等，用于默认骰检定

  static RegExp hiddenTestRegex =
      RegExp(r'^\.(r?a?)h(.+)'); // 匹配 .h、.rh、.rah 后跟任意字符，用于暗骰

  static RegExp versusTestRegex =
      RegExp(r'^\.(r?a?)v(.+)'); // 匹配 .v、.rv、.rav 后跟任意字符，用于对抗

  static RegExp cocSanityCheckRegex =
      RegExp(r'^\.sc\s+(.+)'); // 匹配 .sc 后跟任意字符，用于 COC 理智检定

  static RegExp cocGrowthCheckRegex = RegExp(r'^\.en$'); // 匹配 .en

  static RegExp dndDeathSavingThrowRegex = RegExp(r'^\.ds$'); // 匹配 .ds

  static RegExp initiativeRegex = RegExp(r'^\.(ri|init)$'); // 匹配 .ri 或 .init

  static RegExp characterCardOperationRegex =
      RegExp(r'^\.st\s+(.+)'); // 匹配 .st 后跟任意字符，用于人物卡操作

  static RegExp characterCardShowRegex =
      RegExp(r'^\.st\s+show+(.+)?$'); // 匹配 .st show 或 .st show 后跟任意字符，用于人物卡展示

  static RegExp characterCardLinkRegex =
      RegExp(r'^\.nn\s+(.+)'); // 匹配 .nn 后跟任意字符，用于人物卡关联

  static RegExp logControlRegex =
      RegExp(r'^\.log\s+(on|off)$'); // 匹配 .log on 或 .log off

  static DiceCommandType parseCommand(String command) {
    if (d100Regex.hasMatch(command)) {
      return DiceCommandType.d100;
    } else if (d100TestRegex.hasMatch(command)) {
      return DiceCommandType.d100Test;
    } else if (hiddenTestRegex.hasMatch(command)) {
      return DiceCommandType.hiddenTest;
    } else if (versusTestRegex.hasMatch(command)) {
      return DiceCommandType.versusTest;
    } else if (cocSanityCheckRegex.hasMatch(command)) {
      return DiceCommandType.cocSanityCheck;
    } else if (cocGrowthCheckRegex.hasMatch(command)) {
      return DiceCommandType.cocGrowthCheck;
    } else if (dndDeathSavingThrowRegex.hasMatch(command)) {
      return DiceCommandType.dndDeathSavingThrow;
    } else if (initiativeRegex.hasMatch(command)) {
      return DiceCommandType.initiative;
    } else if (characterCardShowRegex.hasMatch(command)) {
      return DiceCommandType.characterCardShow;
    } else if (characterCardOperationRegex.hasMatch(command)) {
      return DiceCommandType.characterCardOperation;
    } else if (characterCardLinkRegex.hasMatch(command)) {
      return DiceCommandType.characterCardLink;
    } else if (logControlRegex.hasMatch(command)) {
      return DiceCommandType.logControl;
    } else if (defaultTestRegex.hasMatch(command)) {
      return DiceCommandType.defaultTest;
    } else {
      return DiceCommandType.unknown;
    }
  }
}
