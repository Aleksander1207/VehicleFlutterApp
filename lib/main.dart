import 'package:flutter/material.dart';
import 'myForm.dart';


void main()=>runApp(LoginForm());

class LoginForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Login Page',
      home:MyForm(),
    );
  }
}