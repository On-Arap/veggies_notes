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

  RecipeData({required this.title, required this.imageUrl});
}

class RecipePage extends StatefulWidget {
  final Destination destination;
  final String title;
  final String imageUrl;

  const RecipePage({super.key, required this.destination, required this.title, required this.imageUrl});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void dispose() {
    context.read<GeminiRecipeCubit>().generateRecipe('');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
              child: Wrap(
                spacing: 0.0, // gap between adjacent chips
                runSpacing: 10.0, // gap between lines
                children: [
                  RecipeIcon(icon: LineIcons.hourglass, text: "20min"),
                  RecipeIcon(icon: LineIcons.rocket, text: "easy"),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                height: 10.0,
                thickness: 2,
              ),
            ),
            BlocBuilder<GeminiRecipeCubit, List<String>>(
              builder: (context, state) {
                if (state.isNotEmpty) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          tileColor: index.isEven ? const Color(0xFF191C1B) : const Color(0xFF252928),
                          title: Text(state[index]),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                height: 10.0,
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
