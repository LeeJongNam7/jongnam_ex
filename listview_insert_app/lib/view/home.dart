import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal.dart';
import 'package:listview_insert_app/view/first_page.dart';
import 'package:listview_insert_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  //Property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList= [];
    addList();
  }

  addList(){
    
    List<String> imagePathList =[
      'images/bee.png',
      'images/cat.png',
      'images/cow.png',
      'images/dog.png',
      'images/fox.png',
      'images/monkey.png',
      'images/pig.png',
      'images/wolf.png',
    ];

    List<String> animalNameList = [
      '벌',
      '고양이',
      '소',
      '강아지',
      '여우',
      '원숭이',
      '돼지',
      '늑대',
    ];

    List<String> animalKindList = [
      '곤충',
      '포유류',
      '포유류',
      '포유류',
      '포유류',
      '영장류',
      '포유류',
      '포유류',
    ];
    List<bool> flyExistList =[
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    for(int i = 0; i < imagePathList.length; i++){
      animalList.add(Animal(
        imagePath: imagePathList[i],
        animalName: animalNameList[i],
        flyExist: flyExistList[i],
        kind: animalKindList[i]),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FirstPage(list: animalList,
          ),
          SecondPage(list: animalList
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}