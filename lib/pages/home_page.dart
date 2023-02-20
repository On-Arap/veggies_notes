import 'package:flutter/material.dart';
import 'package:veggies_notes/components/my_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Home', Icons.home),
    Destination(1, 'Search', Icons.search),
    Destination(2, 'Explore', Icons.explore),
    Destination(3, 'Map', Icons.map),
    Destination(3, 'Profil', Icons.person),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: allDestinations.map((Destination destination) {
          return NavigationDestination(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Home'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Search'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Explore'),
        ),
        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Map'),
        ),
        Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Profil'),
        ),
      ][currentPageIndex],
    );
  }
}
