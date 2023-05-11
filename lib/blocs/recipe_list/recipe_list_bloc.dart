import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  RecipeListBloc() : super(RecipeListLoading()) {
    on<LoadRecipes>((event, emit) {
      emit(const RecipeListLoaded(recipes: ["", ""]));
    });
    on<UpdateRecipes>((event, emit) {
      emit(const RecipeListLoaded(recipes: ["Test", "Test"]));
    });
  }
}
