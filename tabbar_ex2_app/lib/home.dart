import 'package:flutter/material.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); //controller를 종료하고 앱을 종료시켜야한다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 178, 214),
      // appBar: AppBar(
      //   title: const Text('Flower'),
      //   backgroundColor: Colors.blueAccent,
      //   foregroundColor: Colors.white,
      //   centerTitle: false,
      // ),
      body: TabBarView(
        controller: controller,
        children: const [FirstPage(), SecondPage(),ThirdPage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          controller: controller,
          unselectedLabelColor: Colors.blue,
          labelColor: Colors.blue,
          indicatorColor: Colors.blue,
          indicatorWeight: 5,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.swipe,
                color: Colors.blue,
              ),
              text: "Swipe",
            ),
            Tab(
              icon: Icon(
                Icons.ads_click,
                color: Colors.red,
              ),
              text: "Button",
            ),
            Tab(
              icon: Icon(
                Icons.punch_clock,
                color: Colors.black,
              ),
              text: "Timer",
            ),
          ],
        ),
      ),
    );
  }
}
