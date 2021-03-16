import 'package:Gara6/vehicleFormElements/vehicleFieldsClasses.dart';
import 'package:flutter/material.dart';
import '../getVehicleBrands.dart';

class VehicleBrandMenu extends StatelessWidget{
  final Future<VehicleBrands> brands;
  final String brandName;
  final Function addBrand;
  final ValueChanged<String> onChanged;

  VehicleBrandMenu(this.brands,this.brandName,this.addBrand, this.onChanged);

  void handleBrandChanged(String brandName){
    onChanged(brandName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VehicleBrands>(
        future: brands,
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<String> vehicleBrands = List<String>();
            for(int i=snapshot.data.brands.length-1;i>=0;i--){
              VehicleBrand vBrand = VehicleBrand(snapshot.data.brands[i]['id'], snapshot.data.brands[i]['name']);
              addBrand(vBrand);
              vehicleBrands.add(snapshot.data.brands[i]['name']);
            }
            return DropdownButton<String>(
              hint:  Text("Select Vehicle Brand"),
              value:brandName,
              onChanged: handleBrandChanged,
              items: vehicleBrands.map((String vehicleBrand){
                return DropdownMenuItem(
                  value:vehicleBrand,
                  child: Row(
                    children: [
                      Text('$vehicleBrand')
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
            return TextFormField(
                decoration: const InputDecoration(
                hintText: 'Vehicle Brand'
                ),
            );
          }
        }
    );
  }
}