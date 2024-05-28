import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class GeminiRecipeCubit extends Cubit<List<String>> {
  GeminiRecipeCubit() : super(([]));

  void generateRecipe(String title) async {
    //generate Gemini Recipe
    const List<String> veggieTartifletteRecipe = [
      "Preheat the oven to 180°C (350°F).",
      "In a large pot of boiling water, cook the potatoes for 10-15 minutes, or until tender. Drain and set aside.",
      "Heat olive oil in a large skillet over medium heat. Add the onions and cook until softened and translucent, about 5 minutes.",
      "Add the smoked tofu strips to the pan with the onions and cook until slightly caramelized, about 5 minutes more.",
      "Add the sliced cremini mushrooms and minced garlic to the pan and cook for another 2-3 minutes, until the mushrooms are softened. Season with salt and pepper.",
      "In a baking dish, spread a layer of the cooked potatoes. Top with the onion-tofu-mushroom mixture. Pour over the heavy whipping cream.",
      "Lay the sliced Reblochon cheese over the top of the dish, making sure to cover the entire surface.",
      "Bake the tartiflette in the preheated oven for 20-25 minutes, or until the cheese is melted and bubbly.",
      "Let the tartiflette cool slightly before serving. Enjoy warm!",
    ];

    emit(veggieTartifletteRecipe);
  }
}
