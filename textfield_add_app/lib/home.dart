import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Property
late TextEditingController num1Controller;
late TextEditingController num2Controller;
late int sum;

@override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    sum=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("덧셈구하기"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                    controller: num1Controller,
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: '첫번째 숫자를 입력하세요',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("+",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                    controller: num2Controller,
                    keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: '두번째 숫자를 입력하세요',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () => inputCheck(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                child: const Text('덧셈 계산')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("입력하신 숫자의 합은 $sum 입니다.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  //---Function---
  inputCheck(){
    if(num1Controller.text.trim().isEmpty || 
        num2Controller.text.trim().isEmpty){
        errorSnackBar();
        }else{
        sum = int.parse(num1Controller.text.trim()) + 
            int.parse((num2Controller.text.trim()));
            setState(() {});
        }
  }
  
  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('숫자를 입력 하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        ),
    );
  }

}  //End