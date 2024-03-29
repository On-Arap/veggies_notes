import 'package:flutter/material.dart';
import '../constant/destinations.dart';

class SearchPage extends StatefulWidget {
  final Destination destination;

  final textController = TextEditingController();

  SearchPage({super.key, required this.destination});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Search Page"),
          TextField(
            controller: widget.textController,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
        ],
      ),
    );
  }
}
