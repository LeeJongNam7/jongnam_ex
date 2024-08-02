class CalcBMI{
  late double doubleWeight;
  late double doubleHeight;

  CalcBMI(String Weight, String Height){
    doubleWeight = double.parse(Weight);
    doubleHeight = double.parse(Height) / 100;  //BMI계산은 meter법을 사용
  }

  calcAction(){ 
    String bmiString = '';      //bmi 분류
    String imageString = '';    //bmi Image

    double bmi = double.parse(
      (doubleWeight / (doubleHeight * doubleHeight)).toStringAsFixed(1)); //소수점 1자리까지 나오게 하는 방법
      if(bmi < 18.4){
        bmiString = '저체중';
        imageString = 'bmi_0.jpg';
      }else if(bmi >= 18.5 && bmi <=22.9){
        bmiString = '정상체중';
        imageString= 'bmi_1.jpeg';
      }else if(bmi >= 23 && bmi <=24.9){
        bmiString = '과체중';
        imageString = 'bmi_2.jpeg';
      }else if(bmi >= 25 && bmi <=29.9){
        bmiString = '비만';
        imageString = 'bmi_4.jpeg';
      }else{
        bmiString='고도비만';
        imageString = 'bmi_5.jpeg';
      }

      return (bmi.toString(), bmiString, imageString);
  }
}