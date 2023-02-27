import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  String title;
  String imageUrl;

  RecipePage({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
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
