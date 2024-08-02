import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Property
late int count;
late String appbarText;

@override
  void initState() {
    super.initState();
    count = 6;
    appbarText = "Count Up";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarText),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('현재 클릭수는 $count 입니다.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  onPressed: (){
                    count++;
                    setState(() {});
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Image.asset('images/smile.png'),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  onPressed: (){
                  count--;
                  setState(() {});
                  },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  //------------

} //end
