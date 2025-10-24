import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          Text('About', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text("This application is made for the Introduction to Mobile Programming 1 homework."),
          SizedBox(height: 8),
          Text('Features: Login/Register, Searching for instructors, Zooming infrastructure images, List of courses.'),
        ],
      ),
    );
  }
}
