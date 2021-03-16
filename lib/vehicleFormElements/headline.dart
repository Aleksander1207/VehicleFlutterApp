import 'package:flutter/material.dart';

class Headline extends StatelessWidget{
  final String text;

  Headline(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[500],
        margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child:Padding(
        padding: EdgeInsets.all(15),
        child:Text(text,
          style: TextStyle(
            fontSize: 24,
            color:Colors.white,
          ),
        ),
      )
    );
  }
}