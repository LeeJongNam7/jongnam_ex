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
    sum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "덧셈 결과 : $sum",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: num2Controller,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => inputCheck(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          '덧셈 계산'
                        )
                      ],
                    ),
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //-------Functions ----------
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
    //
  }
} //End