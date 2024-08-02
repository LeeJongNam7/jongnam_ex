import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  //Property
  late List<String> imagesFile;
  late int currentPage;
  late bool isRunning;

  @override
  void initState() {
    super.initState();
    imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;
    isRunning = true;

    //Timer 설치
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (!isRunning) {
          timer.cancel();
        }
        changeImage();
      },
    );
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imagesFile[currentPage],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Image.asset('images/${imagesFile[currentPage]}'),

            //-- For Event Test --
            // ElevatedButton(
            // onPressed: () => changeImage(),
            // child: const Text('Test'))
          ],
        ),
      ),
    );
  }

  //--- Functions ---
  changeImage() {
    if (currentPage >= imagesFile.length) {
      currentPage++;
      currentPage = 0;
    }
    if (isRunning == true) {
      setState(() {});
    }
  }
}
