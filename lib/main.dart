import 'package:flutter/material.dart';
import 'package:just_learn/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wisata Bandung', theme: ThemeData(), home: const MainScreen());
  }
}
