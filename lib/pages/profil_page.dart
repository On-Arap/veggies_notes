import 'package:flutter/material.dart';
import '../constant/destinations.dart';

class ProfilPage extends StatefulWidget {
  final Destination destination;

  const ProfilPage({super.key, required this.destination});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You're not connected"),
          const SizedBox(height: 10.0),
          MaterialButton(color: Theme.of(context).colorScheme.onSecondary, child: const Text("Sign In"), onPressed: () {}),
          const SizedBox(height: 10.0),
          const Divider(
            height: 20.0,
            thickness: 2,
          ),
          const SizedBox(height: 10.0),
          MaterialButton(color: Theme.of(context).colorScheme.onSecondary, child: const Text("Register"), onPressed: () {}),
        ],
      ),
    );
  }
}
