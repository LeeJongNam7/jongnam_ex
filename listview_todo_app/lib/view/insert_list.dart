import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {

  //Property
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '목록을 입력 하세요',
              ),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: (){
                if(textEditingController.text.trim().isNotEmpty){
                  addList();
                }
                Navigator.pop(context);
              },
              child: const Text("Ok"))
          ],
        ),
      ),
    );
  }
  
  // ---Functions ---
  addList(){
    Message.imagePath = 'images/pencil.png';
    Message.workList = textEditingController.text.trim(); //trim 습관적으로 string일때 넣어주기
    Message.action = true;
  }

}  //end