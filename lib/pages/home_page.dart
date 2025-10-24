import 'package:flutter/material.dart';
import 'people_page.dart';
import 'infrastructure_page.dart';
import 'about_page.dart';
import 'courses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;

  final _pages = const [
    AboutPage(),
    PeoplePage(),
    InfrastructurePage(),
    CoursesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Department App')),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.info_outline), label: 'About'),
          NavigationDestination(icon: Icon(Icons.people_outline), label: 'Instructors'),
          NavigationDestination(icon: Icon(Icons.apartment_outlined), label: 'Infrastructure'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Courses'),
        ],
      ),
    );
  }
}
