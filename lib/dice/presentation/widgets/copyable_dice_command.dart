import 'package:flutter/material.dart';

class CommandTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('指令'),
        ),
        DataColumn(
          label: Text('说明'),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.d100 / .d%')),
            DataCell(Text('掷骰')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.d100侦查')),
            DataCell(Text('以掷骰结果检定')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.侦查 / .r侦查 / .d侦查 / .rd侦查')),
            DataCell(Text('以默认骰检定')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.h心理学 / .rh心理学 / .rah心理学')),
            DataCell(Text('暗骰')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.v力量 / .rv力量 / .rav力量')),
            DataCell(Text('对抗')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.sc 0/1d10')),
            DataCell(Text('COC 理智检定')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.en')),
            DataCell(Text('COC 成长检定')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.ds')),
            DataCell(Text('DND 死亡豁免')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.ri / .init')),
            DataCell(Text('先攻列表')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.st hp+1 / .st &格斗=1d3')),
            DataCell(Text('人物卡操作')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.st show / .st show 力量')),
            DataCell(Text('人物卡展示')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.nn铃木翼')),
            DataCell(Text('人物卡关联')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(SelectableText('.log on / .log off')),
            DataCell(Text('后台 Log 记录')),
          ],
        ),
      ],
    );
  }
}
