import 'package:flutter/material.dart';
import 'package:veggies_notes/component/recipe_icon.dart';
import '../constant/destinations.dart';
import 'package:line_icons/line_icons.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
              child: Wrap(
                spacing: 0.0, // gap between adjacent chips
                runSpacing: 10.0, // gap between lines
                children: [
                  RecipeIcon(icon: LineIcons.hourglass, text: "20min"),
                  RecipeIcon(icon: LineIcons.rocket, text: "easy"),
                  RecipeIcon(icon: LineIcons.cut, text: "10min"),
                  RecipeIcon(icon: LineIcons.fire, text: "10min"),
                  RecipeIcon(icon: LineIcons.leaf, text: "Veggie"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                height: 10.0,
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
