import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 54, 199, 146)),
        useMaterial3: true,
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/second',
          page: () => const SecondPage(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(seconds: 3),
        ),
      ],
    );
  }
}
