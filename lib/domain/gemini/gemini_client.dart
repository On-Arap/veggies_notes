import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiClient {
  final GenerativeModel model;

  GeminiClient({
    required this.model,
  });

  Future generateContentFromText({
    required String prompt,
  }) async {
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text;
  }
}
