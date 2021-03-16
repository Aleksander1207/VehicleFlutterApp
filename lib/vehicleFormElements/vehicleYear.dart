import 'package:flutter/material.dart';

class VehicleYearDropdown extends StatelessWidget{
  final int year;
  final List<int> years = List<int>.generate(53,(index)=>index+1970);
  final ValueChanged<int> onChanged;

  VehicleYearDropdown(this.year,this.onChanged);

  void handleYearChanged(int selectedYear){
    onChanged(selectedYear);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      hint:  Text("Select Year"),
      value:year,
      onChanged: handleYearChanged,
      items: years.map((int vehicleYear){
        return DropdownMenuItem(
            value:vehicleYear,
            child: Row(
              children: [
                Text('$vehicleYear')
              ],
            ),
        );
      }).toList(),
    );
  }
}

