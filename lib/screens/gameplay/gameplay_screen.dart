import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../game/feel_the_beat_game.dart';

class GameplayScreen extends StatelessWidget {
  const GameplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: FeelTheBeatGame(),
      ),
    );
  }
}
