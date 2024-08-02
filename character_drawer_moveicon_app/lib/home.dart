import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late TextEditingController strController;  //글자입력
  late int currentIndex;                     //현재인덱스
  late List<String> veiwData;                //글씨정보리스트
  late String viewMaindata;                  //메인화면글씨정보
  late bool heartSwitch;                     //하트스위치 
  late bool starSwitch;                      //별스위치
  late List<double> imagePosition;            //하단 이미지 위치
  late int starNum;                           //하단 이미지 위치정보
  late String showImage;                      //상단 이미지 글씨
  late int addImage;                          //상단 이미지 글씨숫자
  late String finalshowImage;


  @override
  void initState() {
    super.initState();
    strController = TextEditingController();
    currentIndex = 0;
    veiwData = strController.text.split('');
    viewMaindata = '';
    heartSwitch = false;
    starSwitch = false;
    imagePosition = [
      0,
      60,
      140,
      220,
      300,
    ];
    starNum =0;
    showImage = '';
    addImage = 0;
    finalshowImage = '';
    
    

    Timer.periodic(
      const Duration(seconds: 1),
      (timer){
        pressButton();
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Center(
                child: Text('광고 문구를 입력하세요',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
            ),
            TextField(
              controller: strController,
              decoration: const InputDecoration(
                labelText: '글자를 입력하세요',
              ),
            ),
            ElevatedButton(
              onPressed: (){
                popDrawer();
              },
              child: const Text('광고문구 생성')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/heart.jpg',
                width: 20,
                height: 20,),
              Switch(
                value: heartSwitch,
                onChanged: (value){
                heartSwitch = value;
                switchAction();
                }
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/star.png',
                width: 20,
                height: 20,),
              Switch(
                value: starSwitch,
                onChanged: (value){
                starSwitch = value;
                switchAction();
                }
              ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                showImage,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          Text(viewMaindata,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold
          ),
          ),
          Stack(
            children:[
              SizedBox(
                width: 400,
                height: 100,
              ),
              Positioned(
                left: imagePosition[starNum],
                child: Image.asset('images/star.png',
                height: 30,
                width: 30,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Functions ---
  pressButton(){  
    if(veiwData.isNotEmpty){
      if(currentIndex >= strController.text.length || starNum >= 4){
        currentIndex = 0;
        starNum = 0;
        viewMaindata = veiwData[currentIndex];
        finalshowImage = finalshowImage + showImage;
      }else{
      viewMaindata += veiwData[currentIndex];
    }
    currentIndex ++;
    starNum ++;
    setState(() {});
    }
  }

    popDrawer(){
      Navigator.pop(context);
      veiwData = strController.text.split('');

      viewMaindata = '';
      currentIndex = 0;
      setState(() {});
    }


    
    switchAction(){
      starNum++;
      if(heartSwitch == true && starSwitch == false){
        showImage = '❤️';
        if(starNum>= 5){
          starNum = 0;
        }
      }else if(starSwitch == true && heartSwitch == false){
        showImage = '⭐️';
        if(starNum >= 5){
          starNum = 0;
        }
      }
        setState(() { });
      }
} //end