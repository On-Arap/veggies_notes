import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  RecipeListBloc() : super(RecipeListLoading()) {
    on<LoadRecipes>(_mapLoadRecipes);
    on<UpdateRecipes>(_mapUpdateRecipes);
  }

  void _mapLoadRecipes(event, emit) {
    sleep(Duration(seconds: 3));
    emit(const RecipeListLoaded(recipes: ["", ""]));
  }

  void _mapUpdateRecipes(event, emit) {
    emit(const RecipeListLoaded(recipes: ["Test", "Test"]));
  }
}
