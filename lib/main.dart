import 'package:flutter/material.dart';
import 'package:veggies_notes/home.dart';
import 'blocs/recipe_list/recipe_list_bloc.dart';
import "constant/color_scheme.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeListBloc()..add(LoadRecipes()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ),
        home: const HomePage(),
      ),
    );
  }
}
