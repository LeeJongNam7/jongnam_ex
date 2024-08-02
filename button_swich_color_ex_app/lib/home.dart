import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//property
late Color buttonColor;
late bool switchValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (){
          
              },
              child: const Text('Flutter')
            ),
          ),
          Switch(
            value: ,
            onChanged: (value){

            })
        ],
      ),
    );
  }

  changeSwitch(){
    switchValue = switchValue ? false : true;

    changeButtonColor();
  }

  changeButtonColor(){
    buttonColor = switchValue ? Colors.red : Colors.blue;
    setState(() {});
  }
} //end