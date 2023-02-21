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
    return const Center(
      child: Text("Profil Page"),
    );
  }
}
