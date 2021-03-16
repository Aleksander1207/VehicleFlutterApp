import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatelessWidget{
  final TextEditingController controller;
  final String hint;

  TextFormFieldContainer(this.controller,this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left:50,right: 50,top:20,bottom: 20),
        child: TextFormField(
        decoration: InputDecoration(
        hintText: hint,
    ),
    controller: controller,
    ),
    );
  }
}