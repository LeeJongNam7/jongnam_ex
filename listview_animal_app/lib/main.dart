import 'package:flutter/material.dart';
import 'package:listview_animal_app/view/home.dart';
import 'package:listview_animal_app/view/table_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/' : (context) => const Home(),
        '/table' : (context) => const TableList(),
      },
      initialRoute: '/',
    );
  }
}
