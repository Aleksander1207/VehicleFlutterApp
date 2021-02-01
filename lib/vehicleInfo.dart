import 'package:flutter/material.dart';

class VehicleInfo extends StatelessWidget{
  final Map<String,dynamic> vehicle;

  VehicleInfo(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Vehicle: ${vehicle['regNum']}'),
      ),
      body: Container(
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${vehicle['vehicleBrand']['name']} ${vehicle['vehicleModel']['name']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 30,),
              Text('Registration Number: ${vehicle['regNum']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 30,),
              Text('Vehicle Type: ${vehicle['vehicleType']['code']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}