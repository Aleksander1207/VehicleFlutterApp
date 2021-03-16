import 'package:flutter/material.dart';
import 'vehicleForm.dart';
import 'vehicleFormSetup.dart';
import 'vehiclesBuilder.dart';
import 'loggedInFiles/drawer.dart';
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
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  List<dynamic> vehicleData = vehicleFormSetup(cookie);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VehicleForm(null, null,vehicleData[0],vehicleData[1],vehicleData[2]),),
                  );
                },
              ),
              drawer: MyDrawer(email,cookie,data),
              body:Container(
                  child: VehiclesBuilder(snapshot,cookie),
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