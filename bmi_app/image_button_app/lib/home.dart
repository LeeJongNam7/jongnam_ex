import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Property
late List<String> imageFile;
late int currentPage;
late int nextPage;
late int prevPage;


@override
  void initState() {
    super.initState();
    imageFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;
    nextPage = 1;
    prevPage = 5;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFile[currentPage],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 10,
                      )
                    ),
                    child: Image.asset(
                      'images/${imageFile[currentPage]}',
                    ),
                  ),
                ),
                Positioned(
                  left: 270,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5
                      )
                    ),
                    child: Image.asset(
                      'images/${imageFile[nextPage]}',
                      width: 100,
                      height: 140,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5
                      )
                    ),
                    child: Image.asset(
                      'images/${imageFile[prevPage]}',
                      width: 100,
                      height: 140,
                    )
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => prevButton(),
                  child: const Text('<<이전')
                ),
                ElevatedButton(
                  onPressed: () => nextButton(),
                  child: const Text('다음>>')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Functions---
  prevButton(){
    currentPage --;
    if(currentPage < 0){
      currentPage = imageFile.length -1;
    }
    nextPage --;
    if(nextPage < 0){
      nextPage = imageFile.length -1;
    }
    prevPage --;
    if(prevPage < 0){
      prevPage = imageFile.length -1;
    }
    setState(() {});
  }
  nextButton(){
    currentPage ++;
    if(currentPage >= imageFile.length){
      currentPage = 0;
    }
    nextPage ++;
    if(nextPage >= imageFile.length){
      nextPage = 0;
    }
    prevPage ++;
    if(prevPage >= imageFile.length){
      prevPage = 0;
    }
    setState(() {});
  }

} //End