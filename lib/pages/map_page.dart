import 'package:flutter/material.dart';
import '../constant/destinations.dart';

class MapPage extends StatefulWidget {
  final Destination destination;

  const MapPage({super.key, required this.destination});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Map Page"),
    );
  }
}
