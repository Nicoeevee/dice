import 'package:dashbook/dashbook.dart';
import 'package:dice/flame_jenny/commons/commons.dart';
import 'package:dice/flame_jenny/jenny_advanced_example.dart';
import 'package:dice/flame_jenny/jenny_simple_example.dart';
import 'package:dice/flame_jenny/jenny_test_example.dart';
import 'package:flame/game.dart';

void addFlameJennyExample(Dashbook dashbook) {
  dashbook.storiesOf('FlameJenny')
    ..add(
      'Test example',
      (_) => GameWidget(game: JennyTestExample()),
      codeLink: baseLink('jenny_test_example.dart'),
      info: JennyTestExample.description,
    );
  // ..add(
  //   'Simple Jenny example',
  //   (_) => GameWidget(game: JennySimpleExample()),
  //   codeLink: baseLink('jenny_simple_example.dart'),
  //   info: JennySimpleExample.description,
  // )
  // ..add(
  //   'Advanced Jenny example',
  //   (_) => GameWidget(game: JennyAdvancedExample()),
  //   codeLink: baseLink('jenny_advanced_example.dart'),
  //   info: JennyAdvancedExample.description,
  // );
}
