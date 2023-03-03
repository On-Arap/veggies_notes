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
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 16,
                    child: Row(
                      children: const [
                        Icon(Icons.timer),
                        SizedBox(width: 4.0),
                        Text(
                          "20min",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 16,
                    child: Row(
                      children: const [
                        Icon(Icons.difference),
                        SizedBox(width: 4.0),
                        Text(
                          "easy",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 16,
                    child: Row(
                      children: const [
                        Icon(Icons.cut),
                        SizedBox(width: 4.0),
                        Text(
                          "10min",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 16,
                    child: Row(
                      children: const [
                        Icon(Icons.terrain_outlined),
                        SizedBox(width: 4.0),
                        Text(
                          "Veggie",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 2) - 16,
                    child: Row(
                      children: const [
                        Icon(Icons.fireplace),
                        SizedBox(width: 4.0),
                        Text(
                          "10min",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
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
