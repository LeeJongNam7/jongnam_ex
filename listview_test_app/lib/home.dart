import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late List<String> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  addData() {
    todoList.add("James");
    todoList.add("Cathy");
    todoList.add("Martin");
    todoList.add("유비");
    todoList.add("관우");
    todoList.add("장비");
    todoList.add("조조");
    todoList.add("여포");
    todoList.add("동탁s");
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
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    todoList[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
