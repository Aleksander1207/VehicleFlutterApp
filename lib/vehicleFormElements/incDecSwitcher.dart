import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class IncrementDecrementSwitcher extends StatelessWidget{
  final TextEditingController horsePower;
  final int minValue;
  final int maxValue;

  IncrementDecrementSwitcher(this.horsePower,this.maxValue,this.minValue);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top:20,bottom: 20,left:40,right: 40),
      child:  NumberInputWithIncrementDecrement(
        controller: horsePower,
        min:minValue,
        max:maxValue,
        buttonArrangement: ButtonArrangement.rightEnd,
        incIconColor: Colors.white,
        decIconColor: Colors.white,
        decIconDecoration: BoxDecoration(
          color:Colors.blue,
        ),
        incIconDecoration: BoxDecoration(
          color:Colors.blue,
        ),
        style:TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}