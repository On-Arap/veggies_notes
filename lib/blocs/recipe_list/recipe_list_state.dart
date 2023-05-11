part of 'recipe_list_bloc.dart';

abstract class RecipeListState extends Equatable {
  const RecipeListState();

  @override
  List<Object> get props => [];
}

class RecipeListLoading extends RecipeListState {}

class RecipeListLoaded extends RecipeListState {
  final List<dynamic> recipes;

  const RecipeListLoaded({this.recipes = const []});

  @override
  List<Object> get props => [recipes];
}
