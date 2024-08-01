import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class MenuButton extends AdvancedButtonComponent {
  MenuButton({
    required super.position,
    required super.onReleased,
    required this.text,
  }) : super(size: Vector2(128, 42));

  late String text;

  final Paint white = BasicPalette.white.paint();
  final Paint lightGray = BasicPalette.lightGray.paint();
  final Paint gray = BasicPalette.gray.paint();
  final TextPaint topTextPaint = TextPaint(
    style: TextStyle(color: BasicPalette.black.color),
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    anchor = Anchor.center;

    defaultSkin = RoundedRectComponent()..setColor(white.color);

    defaultLabel = TextComponent(
      text: text,
      textRenderer: topTextPaint,
      position: size / 2,
      anchor: Anchor.center,
      priority: 1,
    );

    hoverSkin = RoundedRectComponent()..setColor(lightGray.color);
    downSkin = RoundedRectComponent()..setColor(gray.color);
  }
}

class RoundedRectComponent extends PositionComponent with HasPaint {
  @override
  void render(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        0,
        width,
        height,
        topLeft: Radius.circular(height),
        topRight: Radius.circular(height),
        bottomRight: Radius.circular(height),
        bottomLeft: Radius.circular(height),
      ),
      paint,
    );
  }
}
