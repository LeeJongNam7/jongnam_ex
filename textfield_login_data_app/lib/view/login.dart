import 'package:flutter/material.dart';
import 'package:textfield_login_data_app/model/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${User.idString}님! 환영 합니다.'),
      ),
      body: Center(
        child: Image.asset('images/bitcoin.jpg'),
      ),
    );
  }
}