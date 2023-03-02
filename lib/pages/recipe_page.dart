import 'package:flutter/material.dart';
import '../constant/destinations.dart';

class RecipeData {
  String title;
  String imageUrl;

  RecipeData({required this.title, required this.imageUrl});
}

class RecipePage extends StatelessWidget {
  final Destination destination;
  final String title;
  final String imageUrl;

  const RecipePage({super.key, required this.destination, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.multiply,
                ),
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
