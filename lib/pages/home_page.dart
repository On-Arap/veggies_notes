import 'package:flutter/material.dart';
import '../component/card_recipe.dart';
import '../constant/destinations.dart';

class HomePage extends StatefulWidget {
  final Destination destination;
  const HomePage({super.key, required this.destination});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CardRecipe(
            title: "Tartiflette vegetarienne",
            imageUrl: "https://i0.wp.com/freethepickle.fr/wp-content/uploads/2021/09/Tartiflettes-lardons-de-champignons-2-of-6.jpg",
            timer: "20min",
            difficulty: "easy",
          ),
          CardRecipe(
            title: "Pantry Pasta with Vegan Cream Sauce",
            imageUrl: "https://assets.bonappetit.com/photos/5e4c58a6cf2f580008eba058/1:1/w_1920%2Cc_limit/HLY_Vegan%2520Alfredo_16x9.jpg",
            timer: "35min",
            difficulty: "medium",
          ),
          CardRecipe(
            title: "Creamy Vegan sun-dried tomato and broccolini gnocchi",
            imageUrl: "https://img.taste.com.au/028Wi8mM/w643-h428-cfill-q90/taste/2020/02/vegan-creamy-sun-dried-tomato-and-spinach-gnocchi-158620-1.jpg",
            timer: "1hour",
            difficulty: "hard",
          ),
        ],
      ),
    );
  }
}
