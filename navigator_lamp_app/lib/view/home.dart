import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/mainedit.dart';
import 'package:navigator_lamp_app/view/edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late TextEditingController textEditingController;
  late String lampState;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    lampState = 'images/lamp_on.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: (){
              Mainedit.textChange = textEditingController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Edit()
                )
              );
            },
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(lampState,
              width: 100
              ,),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  lampChang(){
    lampState = Mainedit.lampChange;
    return lampState;
  }
}