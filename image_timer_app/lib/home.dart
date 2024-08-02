import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late List<String> imagesFile;
  late int currentPage;

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

    //Timer 설치
    Timer.periodic(
      const Duration(seconds: 3), 
      (timer){
        changeImage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
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
            Image.asset(
              'images/${imagesFile[currentPage]}'
            ),


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
  changeImage(){
    currentPage++;
    if(currentPage >= imagesFile.length){
      currentPage =
      0;
    }
      setState(() {});
  }
}