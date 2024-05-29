import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:meta/meta.dart';
import 'package:veggies_notes/domain/gemini/gemini_client.dart';

class GeminiRecipeCubit extends Cubit<List<String>> {
  final _model = GenerativeModel(model: "gemini-1.5-flash", apiKey: 'AIzaSyBK_DW4Z0yfRCTjDbSoTaNsDLE0-qCP2-A');

  GeminiRecipeCubit() : super(([]));

  Future<void> generateRecipe(String title) async {
    if (title.isEmpty) {
      emit([]);
    } else {
      final response = await _model.generateContent([
        Content.text("Can you write me a recipe for a $title, only give me the ingredients, and the instructions"),
      ]);
      print(response.text);
      //generate Gemini Recipe
      emit([response.text!]);
    }
  }
}
