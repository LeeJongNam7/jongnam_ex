import 'dart:ffi';

import 'package:bmi_app/cm/bmi.dart';
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
  late double result;
  late String result2;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    result = 0;
    result2 = '';
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
      ),
      body: Column(
        children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: "신장을 입력하세요 (단위:cm)",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: "몸무게를 입력하세요 (단위:kg)",
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: (){
                clickButton();
              },
              child: const Text('BMI 계산'),
            ),
            Text("귀하의 BMI는 $result이고 $result2 입니다."),
        ],
      ),
    );
  }

  // --- Function ---
  clickButton(){
    if( num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty){
        errorSnackBar();
    }else{
      Bmi bmiresult = Bmi(num1Controller.text.trim(), num2Controller.text.trim());
      result = bmiresult.bmiResult();
      bmiString();
    }
    setState(() {});
  }

  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        ),
    );
  }

  bmiString(){
    if(result < 18.5){
      result2 = '저체중';
    }
    else if(result >=18.5 && result < 23){
      result2 = '정상체중';
    }
    else if(result >= 23 &&result < 25){
      result2 = '과체중';
    }
    else if(result>= 25 && result < 30){
      result2 = '비만';
    }
    else{
      result2 = '고도비만';
    }
    setState(() {});
  }
  resultall(){
    return (clickButton(),bmiString());
  }
} //End