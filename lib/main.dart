import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veggies_notes/root_page.dart';
import 'package:veggies_notes/domain/repository/recipe_repository.dart';
import 'data/blocs/recipe_list/recipe_list_bloc.dart';
import "config/color_scheme.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => RecipeRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RecipeListBloc(recipeRepository: RepositoryProvider.of<RecipeRepository>(context))..add(LoadRecipes()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          home: const RootPage(),
        ),
      ),
    );
  }
}
