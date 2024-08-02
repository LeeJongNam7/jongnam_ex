import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/mainedit.dart';
import 'package:navigator_lamp_app/view/home.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  //Property
  late TextEditingController editingController;
  late bool lampOnoff;
  late String imageName;

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(text: Mainedit.textChange);
    lampOnoff = true;
    imageName = 'images/lamp_on.png';
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
            TextField(
              controller: editingController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("On"),
                Switch(
                  value: lampOnoff,
                  onChanged: (value){
                    lampOnoff = value;
                    switchOnoff();
                  }),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home()
                  
                  )
                );
              },
              child: const Text('OK')
            )
          ],
        ),
      ),
    );
  }

  // ---Functions ---
  switchOnoff(){
    if(lampOnoff){
      Mainedit.lampChange = 'images/lamp_on.png';
    }else{
      Mainedit.lampChange ='images/lamp_off.png';
    }
    setState(() {});
  }
}