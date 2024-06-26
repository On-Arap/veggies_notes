import 'package:flutter/material.dart';
import 'package:veggies_notes/config/routing/destinations.dart';
import 'package:veggies_notes/UI/pages/recipe_page.dart';
import '../../UI/pages/explore_page.dart';
import '../../UI/pages/home_page.dart';
import '../../UI/pages/map_page.dart';
import '../../UI/pages/profil_page.dart';
import '../../UI/pages/search_page.dart';
import '../../UI/pages/text_page.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({
    super.key,
    required this.destination,
    required this.navigatorKey,
  });

  final Destination destination;
  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                {
                  switch (widget.destination.title) {
                    case 'Home':
                      return HomePage(destination: widget.destination);
                    case 'Search':
                      return SearchPage(destination: widget.destination);
                    case 'Explore':
                      return ExplorePage(destination: widget.destination);
                    case 'Map':
                      return MapPage(destination: widget.destination);
                    case 'Profil':
                      return ProfilPage(destination: widget.destination);
                    default:
                      return ProfilPage(destination: widget.destination);
                  }
                }
              case '/recipe':
                {
                  final data = settings.arguments as Map<String, dynamic>;
                  return RecipePage(
                    destination: widget.destination,
                    title: data['title'],
                    imageUrl: data['imageUrl'],
                    timer: data['timer'],
                    difficulty: data['difficulty'],
                  );
                }
              case '/text':
                return TextPage(destination: widget.destination);
            }
            assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }
}
