import 'dart:ui';

import 'package:dice/flame_jenny/components/dialogue_controller_component.dart';
import 'package:dice/flame_jenny/components/menu_button.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:flutter/services.dart';
import 'package:jenny/jenny.dart';

class JennyTestExample extends FlameGame {
  static const String description = '''
    This is a simple example of how to use the Jenny Package. 
    It includes instantiating YarnProject and parsing a .yarn script.
  ''';

  Future<void> startDialogue() async {
    final dialogueControllerComponent = DialogueControllerComponent();
    add(dialogueControllerComponent);

    final yarnProject = YarnProject();
    yarnProject.parse(await rootBundle.loadString('assets/yarn/test.yarn'));
    final dialogueRunner = DialogueRunner(
      yarnProject: yarnProject,
      dialogueViews: [dialogueControllerComponent],
    );
    dialogueRunner.startDialogue('新的故事');
  }

  @override
  Future<void> onLoad() async {
    addAll([
      MenuButton(
        position: Vector2(size.x / 2, 96),
        onReleased: startDialogue,
        text: '开始对话',
      ),
    ]);
  }
}
