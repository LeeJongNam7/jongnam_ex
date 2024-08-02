import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/lamp_state.dart';
import 'package:navigator_lamp_switch_app/view/home.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  //Property
  late bool lampColor;
  late bool lampOnoff;

  @override
  void initState() {
    super.initState();
    lampColor = false;
    lampOnoff = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red'),
                Switch(
                  value: lampColor,
                  onChanged: (value){
                    lampColor == true ? 'images/lamp_on.png' : 'images/lamp_red.png';
                  }
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('On'),
                Switch(
                  value: lampOnoff,
                  onChanged: (value){
                    
                  }
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> const Home())
                );
              },
              child: const Text("OK")
            ),
          ],
        ),
      ),
    );
  }

  // ---Functions ---
  colorChange(){
    if(lampColor == true){
      LampState.lampColor = 'images/lamp_red.png';
    }else{
      LampState.lampColor = 'images/lamp_on.png';
    }
    setState(() {});
  }
}