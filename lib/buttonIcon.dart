import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget{
  final Function buttonFunction;
  final IconData icon;

  ButtonIcon(this.buttonFunction,this.icon,);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: buttonFunction,
      child: Icon(icon,size: 30,color: Colors.white,),
    );
  }
}