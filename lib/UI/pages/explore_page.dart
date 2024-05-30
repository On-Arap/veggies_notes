import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggies_notes/domain/repository/recipe_repository.dart';
import '../../config/routing/destinations.dart';

class ExplorePage extends StatefulWidget {
  final Destination destination;

  const ExplorePage({super.key, required this.destination});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Explore Page"),
          const SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/text');
            },
            color: Colors.grey,
            child: const Text("Button"),
          )
        ],
      ),
    );
  }
}
