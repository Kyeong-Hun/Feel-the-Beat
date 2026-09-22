import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FeelTheBeatGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF101014);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final laneWidth = size.x / 4;

    final lanePaint = Paint()
      ..color = const Color(0xFF202027)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = const Color(0xFF3A3A45)
      ..strokeWidth = 2;

    for (var i = 0; i < 4; i++) {
      final left = laneWidth * i;

      canvas.drawRect(
        Rect.fromLTWH(left, 0, laneWidth, size.y),
        lanePaint,
      );

      if (i > 0) {
        canvas.drawLine(
          Offset(left, 0),
          Offset(left, size.y),
          linePaint,
        );
      }
    }

    // 판정선
    final judgementY = size.y * 0.82;

    final judgementPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(0, judgementY),
      Offset(size.x, judgementY),
      judgementPaint,
    );
  }
}
