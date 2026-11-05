import 'package:flutter/material.dart';
import 'auth_screen.dart';

void main() {
  runApp(const AscendApp());
}

class AscendApp extends StatelessWidget {
  const AscendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ascend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0B),
        primaryColor: const Color(0xFFC9A84C),
      ),
      home: const AuthScreen(),
    );
  }
}