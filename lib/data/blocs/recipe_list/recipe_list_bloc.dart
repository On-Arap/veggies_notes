import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggies_notes/domain/repository/recipe_repository.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final RecipeRepository recipeRepository;

  RecipeListBloc({required this.recipeRepository}) : super(RecipeListLoading()) {
    on<LoadRecipes>(_mapLoadRecipes);
    on<UpdateRecipes>(_mapUpdateRecipes);
  }

  void _mapLoadRecipes(event, emit) async {
    try {
      final recipes = await recipeRepository.getRecipes();
      emit(RecipeListLoaded(recipes: recipes));
    } catch (e) {
      emit(const RecipeListLoaded(recipes: ["", ""]));
    }
  }

  void _mapUpdateRecipes(event, emit) {
    emit(const RecipeListLoaded(recipes: ["Test", "Test"]));
  }
}
