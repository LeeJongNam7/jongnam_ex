import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late List<int> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  addData() {
    for (int i =1; i<=1000; i++){
      todoList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length, //변수가 변하기에 list.length
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Card(
                  color: (index+1) % 10 == 0? Colors.red : Colors.yellow,
                  child: Center(
                    child: Text(
                      '번호: ${todoList[index].toString()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
