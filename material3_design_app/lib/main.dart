import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const seedColor = Color.fromARGB(255, 73, 206, 151);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: seedColor,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
