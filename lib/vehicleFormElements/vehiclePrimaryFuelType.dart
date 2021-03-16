import 'package:flutter/material.dart';

class PrimaryFuelType extends StatelessWidget{
  final String fuelType;
  final ValueChanged<String> onChanged;
  final List<String> fuelTypes=['','Gasoline','Diesel','LPG','Methane','Electric','Hydrogen'];

  PrimaryFuelType(this.fuelType,this.onChanged);

  void handleFuelTypeChanged(String typeFuel){
    onChanged(typeFuel);
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint:  Text('Fuel Type'),
      value:fuelType,
      onChanged: handleFuelTypeChanged,
      items: fuelTypes.map((String vehicleFuelType){
        return DropdownMenuItem(
          value:vehicleFuelType,
          child: Row(
            children: [
              Text('$vehicleFuelType')
            ],
          ),
        );
      }).toList(),
    );
  }
}

