import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  //Property
  late String ledData;
  late int currentIndex;
  late String viewData;
  late List charList;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    ledData = '대한민국';

    ledData = '';
    charList = ledData.split('');


    Timer.periodic(
      const Duration(seconds: 2),
      (timer){
        ledAction();
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Text(viewData,
        style: const TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }

  // --- Function ---
  ledAction(){
    currentIndex ++;
    if(currentIndex >= ledData.length){
      currentIndex = 0;
      viewData = charList[currentIndex];
    }else{
      viewData += charList[currentIndex];
    }
    setState(() {});
  }

}  //End