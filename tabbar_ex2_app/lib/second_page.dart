import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //Property
  late List<String> imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Button"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white),
      body: SimpleGestureDetector(
        child: Column(
          children: [
            Image.asset('images/${imageName[currentImage]}',
            width: 350,
            height: 550,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      pressButton();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('<<이전'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      pressButton();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('다음>>'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  pressButton() {
    if (Text == '다음>>') {
      currentImage += 1;
      if (currentImage > imageName.length) {
        currentImage = 0;
      }
    } else {
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = 5;
      }
    }
    setState(() {});
  }
} //End