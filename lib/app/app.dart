import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';

class FeelTheBeatApp extends StatelessWidget {
  const FeelTheBeatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feel the Beat',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
