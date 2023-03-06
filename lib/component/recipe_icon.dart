import 'package:flutter/material.dart';

class RecipeIcon extends StatelessWidget {
  IconData icon;
  String text;

  RecipeIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 16,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 4.0),
          Text(
            text,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
