import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:veggies_notes/data/cubit/gemini_recipe_cubit.dart';

class CardRecipe extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String timer;
  final String difficulty;

  const CardRecipe({super.key, required this.title, required this.imageUrl, required this.timer, required this.difficulty});

  Color getColorDifficulty() {
    Color color = Colors.white;

    switch (difficulty) {
      case "easy":
        color = Colors.green;
        break;
      case "medium":
        color = Colors.orange;
        break;
      case "hard":
        color = Colors.red;
        break;
      default:
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GeminiRecipeCubit>().generateRecipe(title);
        Navigator.pushNamed(context, '/recipe', arguments: {'title': title, 'imageUrl': imageUrl, 'timer': timer, 'difficulty': difficulty});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: const Color(0xFF1e2a27),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.multiply,
                  ),
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(LineIcons.hourglass),
                            Text(
                              timer,
                              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              difficulty,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: getColorDifficulty()),
                            ),
                            Icon(
                              LineIcons.rocket,
                              size: 20.0,
                              color: getColorDifficulty(),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
