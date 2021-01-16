import 'package:flutter/material.dart';

class MyForm extends StatelessWidget{
  final TextEditingController emailCont;
  final TextEditingController passCont;


  MyForm(this.emailCont,this.passCont);

  Widget build(BuildContext context){
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Enter your email'
          ),
          controller: emailCont,
        ),
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Enter your password'
          ),
          controller: passCont,
        ),
      ],
    );
  }
}