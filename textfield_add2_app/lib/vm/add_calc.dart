class AddCalc{
  //Property
  late String num1str;
  late String num2str;

  //Constructor
  // AddCalc(String numstr1, String numstr2){
    // num1str = numstr1;
    // num2str = numstr2;
    // }
  //Constructor
  AddCalc(String numstr1, String numstr2)
    : num1str = numstr1,
      num2str = numstr2;
  
  //Function
  String addAction(){
    int num1 = int.parse(num1str);
    int num2 = int.parse(num2str);
    int addResult = num1 + num2;
    return "입력하신 숫자의 합은 $addResult 입니다.";
  }
}