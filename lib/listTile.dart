import 'package:flutter/material.dart';

class MyTile extends StatelessWidget{
  final IconData icon;
  final String text;
  final Function tileItem;

  MyTile(this.icon,this.text,this.tileItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(icon),
      title:Text(text,
        style:TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: (){
        tileItem();
      },
    );
  }
}