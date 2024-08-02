import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
   //Property
  late List<String> imageName;
  late int currentIamge;

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
    currentIamge = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Swiping'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: SimpleGestureDetector(
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onDoubleTap: () => _onDoubleTap(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentIamge],
              ),
              Image.asset(
                'images/${imageName[currentIamge]}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  _onVerticalSwipe(direction){                //양옆으로 넘길때 
    if(direction == SwipeDirection.up){
      currentIamge += 1;
      if(currentIamge >= imageName.length){
        currentIamge = 0;
      }
    }else{
      currentIamge -= 1;
      if (currentIamge< 0){
        currentIamge = imageName.length -1;
      }
    }
    setState(() {});
  }
  _onHorizontalSwipe(direction){             //위아래로 넘길때
    if(direction == SwipeDirection.left){
      currentIamge += 1;
      if(currentIamge >= imageName.length){
        currentIamge = 0;
      }
    }else{
      currentIamge -= 1;
      if (currentIamge< 0){
        currentIamge = imageName.length -1;
      }
    }
    setState(() {});
  }
  _onDoubleTap(){                             //더블클릭 했을때
    if(imageName.length > currentIamge){
    currentIamge += 1;
      if(currentIamge == imageName.length){
        currentIamge = 0;
      }
    }
  setState(() {});
  }
}