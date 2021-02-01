import 'package:flutter/material.dart';

class Back extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Positioned(
          left: 40,
          bottom: 0,
          child: RaisedButton(
            onPressed: null,
            child: Icon(
              Icons.arrow_back_rounded,
              color:Colors.white,
            ),
            color: Colors.blue,
          )
        ),
      ],
    );
  }
}