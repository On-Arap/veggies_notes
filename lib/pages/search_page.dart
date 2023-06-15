import 'package:flutter/material.dart';
import '../constant/destinations.dart';

class SearchPage extends StatefulWidget {
  final Destination destination;

  const SearchPage({super.key, required this.destination});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text("Search Page"),
          TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
        ],
      ),
    );
  }
}
