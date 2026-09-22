import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FeelTheBeatApp());
}

class FeelTheBeatApp extends StatelessWidget {
  const FeelTheBeatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feel the Beat',
      theme: ThemeData.dark(),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: FeelTheBeatGame(),
      ),
    );
  }
}

class FeelTheBeatGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF101014);

  @override
  Future<void> onLoad() async {
    // 앞으로 리듬게임의 실제 게임 로직이 들어갈 곳
  }
}
