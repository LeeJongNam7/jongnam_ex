import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/lamp_state.dart';
import 'package:navigator_lamp_switch_app/view/edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late String lampState;

  @override
  void initState() {
    super.initState();
    lampState = 'images/lamp_on.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              LampState.lampColor = lampState;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> const Edit())
                );
            },
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          lampState,
          width: 200,
        ),
      ),
    );
  }
}