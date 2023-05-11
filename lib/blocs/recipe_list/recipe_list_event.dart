part of 'recipe_list_bloc.dart';

abstract class RecipeListEvent extends Equatable {
  const RecipeListEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipes extends RecipeListEvent {}

class UpdateRecipes extends RecipeListEvent {
  final List<dynamic> recipes;

  const UpdateRecipes({this.recipes = const []});

  @override
  List<Object> get props => [recipes];
}
