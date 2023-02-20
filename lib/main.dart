import 'package:flutter/material.dart';
import 'package:veggies_notes/pages/home_page.dart';
import "constant/color_scheme.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: const HomePage(),
    );
  }
}
