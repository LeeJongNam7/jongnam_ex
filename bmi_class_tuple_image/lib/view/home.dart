import 'package:bmi_class_tuple_image/vm/calc_bmi.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String calcResult;
  late String bmiImage;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    calcResult = '';
    bmiImage = 'bmi_6.jpeg';
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
            controller: heightController,
            decoration: const InputDecoration(
              labelText: '신장을 입력하세요(cm)'
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: weightController,
            decoration: const InputDecoration(
              labelText: '몸무게를 입력하세요(kg)'
            ),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: (){
              calcFunction();
            },
            child: const Text('BMI 계산'),
          ),
          Text(
            calcResult,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset("images/$bmiImage"),
        ],
      ),
    );
  }

  // ---Functions ---
  calcFunction(){
    if(heightController.text.trim().isEmpty ||
      weightController.text.trim().isEmpty){
      // errorSnackBar()
    }else{
      // Class <- String height & String weight
      // (double, String, String)
      CalcBMI calcBMI = CalcBMI(weightController.text.trim(), heightController.text.trim());
      (String, String, String) resultCalc = calcBMI.calcAction();
      calcResult = "귀하의 bmi지수는 ${resultCalc.$1}이고 \n${resultCalc.$2} 입니다.";
      bmiImage = resultCalc.$3;
      setState(() {});
    }
  }
}