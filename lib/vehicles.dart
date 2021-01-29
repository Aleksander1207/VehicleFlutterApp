import 'package:flutter/material.dart';

class VehiclesList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Vehicles')
      ),
      body:Center(
        child: Text('Vehicles Page'),
      )
    );
  }
}