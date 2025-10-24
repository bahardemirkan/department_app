import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      'BIM101 - Introduction to Game Programming',
      'BIM201 - Data Structures',
      'BIM301 - Introduction to Mobile Programming I',
      'BIM302 - Introduction to Mobile Programming II',
      'BIM401 - Graduation Project',
    ];
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (ctx, i) => ListTile(
        leading: const Icon(Icons.book_outlined),
        title: Text(courses[i]),
      ),
    );
  }
}
