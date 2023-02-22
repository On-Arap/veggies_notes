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
    return Center(
      child: CardRecipe(
        title: "Tartiflette vegetarienne",
        image: Image.network("https://i0.wp.com/freethepickle.fr/wp-content/uploads/2021/09/Tartiflettes-lardons-de-champignons-2-of-6.jpg?resize=800%2C1000&ssl=1"),
      ),
    );
  }
}
