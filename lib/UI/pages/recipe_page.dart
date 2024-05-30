import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:veggies_notes/UI/widgets/recipe_icon.dart';
import 'package:veggies_notes/data/cubit/gemini_recipe_cubit.dart';
import '../../config/routing/destinations.dart';
import 'package:line_icons/line_icons.dart';

class RecipeData {
  String title;
  String imageUrl;
  String timer;
  String difficulty;

  RecipeData({required this.title, required this.imageUrl, required this.timer, required this.difficulty});
}

class RecipePage extends StatefulWidget {
  final Destination destination;
  final String title;
  final String imageUrl;
  final String timer;
  final String difficulty;

  const RecipePage({super.key, required this.destination, required this.title, required this.imageUrl, required this.timer, required this.difficulty});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.read<GeminiRecipeCubit>().generateRecipe('');
          },
        ),
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                height: 10.0,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
              child: Wrap(
                spacing: 0.0, // gap between adjacent chips
                runSpacing: 10.0, // gap between lines
                children: [
                  RecipeIcon(icon: LineIcons.hourglass, text: widget.timer),
                  RecipeIcon(icon: LineIcons.rocket, text: widget.difficulty),
                  RecipeIcon(icon: LineIcons.cut, text: "10min"),
                  RecipeIcon(icon: LineIcons.fire, text: "10min"),
                  RecipeIcon(icon: LineIcons.leaf, text: "Veggie"),
                ],
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.multiply,
                  ),
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocBuilder<GeminiRecipeCubit, String>(
              builder: (context, state) {
                if (state.isNotEmpty) {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Divider(
                          height: 10.0,
                          thickness: 2,
                        ),
                      ),
                      Text(state),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Divider(
                          height: 10.0,
                          thickness: 2,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const LinearProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
