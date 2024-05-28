import 'package:flutter/material.dart';
import '../../data/blocs/recipe_list/recipe_list_bloc.dart';
import '../widgets/card_recipe.dart';
import '../../config/routing/destinations.dart';
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeListLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        return CardRecipe(
                          title: state.recipes[index]['title'],
                          imageUrl: state.recipes[index]['imageUrl'],
                          timer: state.recipes[index]['timer'],
                          difficulty: state.recipes[index]['difficulty'],
                        );
                      }),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
