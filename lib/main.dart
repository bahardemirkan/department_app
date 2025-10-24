import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DepartmentApp());
}

class DepartmentApp extends StatelessWidget {
  const DepartmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Department App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}
