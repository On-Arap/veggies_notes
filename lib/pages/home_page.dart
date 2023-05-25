import 'package:flutter/material.dart';
import '../blocs/recipe_list/recipe_list_bloc.dart';
import '../component/card_recipe.dart';
import '../constant/destinations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<RecipeListBloc, RecipeListState>(
        builder: (context, state) {
          if (state is RecipeListLoading) {
            return const Center(
                child: CircularProgressIndicator()
            );
          } else if (state is RecipeListLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      print(state.recipes[index]);
                      return CardRecipe(
                        title: state.recipes[index]['title'],
                        imageUrl: state.recipes[index]['imageUrl'],
                        timer: state.recipes[index]['timer'],
                        difficulty: state.recipes[index]['difficulty'],
                      );
                    }
                  ),
                  const CardRecipe(
                    title: "Pantry Pasta with Vegan Cream Sauce",
                    imageUrl: "https://assets.bonappetit.com/photos/5e4c58a6cf2f580008eba058/1:1/w_1920%2Cc_limit/HLY_Vegan%2520Alfredo_16x9.jpg",
                    timer: "35min",
                    difficulty: "medium",
                  ),
                ],
              ),
            );
          } else {
            print("else state");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
