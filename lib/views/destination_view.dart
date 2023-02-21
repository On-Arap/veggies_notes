import 'package:flutter/material.dart';
import 'package:veggies_notes/constant/destinations.dart';
import '../pages/explore_page.dart';
import '../pages/home_page.dart';
import '../pages/map_page.dart';
import '../pages/profil_page.dart';
import '../pages/search_page.dart';
import '../pages/text_page.dart';

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
