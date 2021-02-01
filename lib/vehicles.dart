import 'package:flutter/material.dart';
import 'package:test_flutter_app/vehiclesBuilder.dart';
import 'drawer.dart';
import 'getVehicles.dart';
import 'login.dart';

class VehiclesList extends StatelessWidget{
  final Future<Vehicles> vehicles;
  final String cookie;
  final String email;
  final Future<ResponseData> data;

  VehiclesList(this.vehicles,this.cookie,this.email,this.data);

  @override
  Widget build(BuildContext context){
    return FutureBuilder<Vehicles>(
      future: vehicles,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Scaffold(
              appBar: AppBar(
                  title:Text('Vehicles')
              ),
              drawer: MyDrawer(email,cookie,data),
              body:Container(
                  child: VehiclesBuilder(snapshot),
              ),
          );
        }
        else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator(
          backgroundColor: Colors.white,
        );
      }
    );


  }
}