import 'package:flutter/material.dart';
import 'package:test_flutter_app/vehicleInfo.dart';

class VehiclesBuilder extends StatelessWidget{
  final dynamic snapshot;

  VehiclesBuilder(this.snapshot);

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
                  MaterialPageRoute(builder: (context) => VehicleInfo(item)),
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