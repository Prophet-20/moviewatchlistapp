import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'The Screening Room',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFE6B887),
        brightness: Brightness.dark,
        surface: const Color(0xFF14191F),
      ),
      scaffoldBackgroundColor: const Color(0xFF101419),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF101419),
        foregroundColor: Color(0xFFF4EEE5),
        centerTitle: false,
      ),
    ),
    home: const HomeScreen(),
  );
}
