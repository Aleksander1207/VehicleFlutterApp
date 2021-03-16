import 'package:flutter/material.dart';
import 'vehicleInfo.dart';

class VehiclesBuilder extends StatelessWidget{
  final dynamic snapshot;
  final String cookie;

  VehiclesBuilder(this.snapshot,this.cookie);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.vehicles.length,
      itemBuilder: (context,index){
        final item=snapshot.data.vehicles[index];
        return Column(
          children: [
            ListTile(
              title:Text(item['regNum'].toString(),
                  style:TextStyle(
                    color: Colors.blue,
                  )
              ),
              leading:Icon(Icons.directions_car,
                color: Colors.blue,
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleInfo(item,cookie)),
                );
              },
            ),
            Divider(),
          ],
        );
      },
    );
  }
}