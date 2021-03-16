import 'package:Gara6/vehicleFormElements/vehicleFieldsClasses.dart';
import 'package:flutter/material.dart';
import '../getVehicleModels.dart';


class VehicleModelMenu extends StatelessWidget{
  final Future<VehicleModels> models;
  final String brandName;
  final String modelName;
  final Function addModel;
  final ValueChanged<String> onChanged;

  VehicleModelMenu(this.models,this.brandName,this.modelName,this.addModel, this.onChanged);

  void handleModelChanged(String modelName){
    onChanged(modelName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VehicleModels>(
        future: models,
        builder: (context,snapshot){
          if(snapshot.hasData){
                List<String> vehicleModels=List<String>();
                for(int i=snapshot.data.data.length-1;i>=0;i--){
                  if(snapshot.data.data[i]!=null && snapshot.data.data[i]['vehicleBrand'] != null && snapshot.data.data[i]['vehicleBrand']['name']==brandName){
                    VehicleModel vModel = VehicleModel(snapshot.data.data[i]['id'], snapshot.data.data[i]['name']);
                    addModel(vModel);
                    vehicleModels.add(snapshot.data.data[i]['name'].toString());
                  }
                }
              return DropdownButton<String>(
                hint: Text("Select Vehicle Model"),
                value: modelName,
                onChanged: handleModelChanged,
                items: vehicleModels.map((String vehicleModel) {
                  return DropdownMenuItem(
                    value: vehicleModel,
                    child: Row(
                      children: [
                        Text('$vehicleModel')
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