import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RecipeRepository {
  final _firebaseDatabase = FirebaseFirestore.instance.collection('recipes');

  RecipeRepository();

  Future<void> create(String title, String difficulty, String timer, String imageUrl) async {
    try {
      await _firebaseDatabase.add({"id": 0, "title": title, "difficulty": difficulty, "imageUrl": imageUrl, "timer": timer});
    } on FirebaseException catch (e) {
      if (kDebugMode) print("Failed with error '${e.code}' : ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getRecipes() async {
    List<dynamic> recipes = [];
    try {
      final recipesDocs = await _firebaseDatabase.orderBy("id", descending: false).get();
      for (var i = 0; i < recipesDocs.docs.length; i++) {
        recipes.add(recipesDocs.docs[i].data());
      }

      return recipes;
    } on FirebaseException catch (e) {
      if (kDebugMode) print("Failed with error '${e.code}' : ${e.message}");
      return recipes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
