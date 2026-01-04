import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NexoLiveApp());
}

class NexoLiveApp extends StatelessWidget {
  const NexoLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXO Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF6B3FA0),
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}