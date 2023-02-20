import 'package:flutter/material.dart';
import 'package:veggies_notes/components/my_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyNavbar(),
      body: Center(child: Text("Hello World")),
    );
  }
}
