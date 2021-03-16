import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget{
  final String text;

  FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Text(
      text,
      style:TextStyle(
        color: Colors.blue,
        fontSize: 18,
      ),
        )
    );
  }
}