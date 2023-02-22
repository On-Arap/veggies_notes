import 'package:flutter/material.dart';

class CardRecipe extends StatelessWidget {
  String title;
  Image image;

  CardRecipe({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Text(title),
            ),
            SizedBox(
                child: AspectRatio(
              aspectRatio: 1,
              child: image,
            )),
          ],
        ),
      ),
    );
  }
}
