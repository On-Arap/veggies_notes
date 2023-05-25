import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RecipeRepository {
  final _firebaseDatabase = FirebaseFirestore.instance.collection('recipes');

  RecipeRepository();

  Future<void> create() async {
    try {
      await _firebaseDatabase.add({"id": "24564", 
      "title": "Test recette add firebase", 
      "difficulty": "medium", 
      "imageUrl": [""], 
      "timer": "30min"});
    } on FirebaseException catch (e) {
      if (kDebugMode)
        print("Failed with error '${e.code}' : ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

    Future<List<dynamic>> getRecipes() async {

    List<dynamic> recipes = ["", ""];
    try {
      final recipesDocs = await _firebaseDatabase.get();
      recipesDocs.docs.forEach((recipe) {
        return recipes.add(recipe.data());
      });

      return recipes;
    } on FirebaseException catch (e) {
      if (kDebugMode)
        print("Failed with error '${e.code}' : ${e.message}");
      return recipes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}