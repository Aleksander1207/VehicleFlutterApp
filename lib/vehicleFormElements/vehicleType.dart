import 'package:Gara6/vehicleFormElements/vehicleFieldsClasses.dart';
import 'package:flutter/material.dart';
import '../getVehicleType.dart';

class VehicleTypeMenu extends StatelessWidget{
  final Future<VehicleTypes> types;
  final String type;
  final ValueChanged<String> onChanged;
  final Function addVehicleType;

  VehicleTypeMenu(this.types,this.type, this.addVehicleType, this.onChanged);

  void handleTypeChanged(String vehicleType){
    onChanged(vehicleType);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VehicleTypes>(
      future: types,
      builder: (context,snapshot){
       if(snapshot.hasData){
         List<String> vehicleTypes = List<String>();
         for(int i = snapshot.data.types.length-1;i>=0;i--){
             VehicleType vType = VehicleType(snapshot.data.types[i]['id'], snapshot.data.types[i]['code']);
             addVehicleType(vType);
             vehicleTypes.add(snapshot.data.types[i]['code'].toString());
         }
         return DropdownButton<String>(
             hint:  Text("Select Vehicle Type"),
             value:type,
             onChanged: handleTypeChanged,
             items: vehicleTypes.map((String vehicleType){
               return DropdownMenuItem(
                 value:vehicleType,
                 child: Row(
                   children: [
                     Text('$vehicleType')
                   ],
                 ),
               );
             }).toList(),
         );
       }
       else if(snapshot.hasError){
         return Text('${snapshot.error}');
       }
       else{
         return CircularProgressIndicator();
       }
      }
    );
  }
}