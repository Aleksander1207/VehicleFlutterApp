import 'package:flutter/material.dart';

class VehicleMonthDropdown extends StatelessWidget{
  final int month;
  final ValueChanged<int> onChanged;
  final List<int> months = List<int>.generate(12,(index)=>index+1);

  VehicleMonthDropdown(this.month,this.onChanged);

  void handleMonthChanged(int selectedMonth){
    onChanged(selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      hint:  Text("Select Month"),
      value:month,
      onChanged: handleMonthChanged,
      items: months.map((int vehicleMonth){
        return DropdownMenuItem(
          value:vehicleMonth,
          child: Row(
            children: [
              Text('$vehicleMonth')
            ],
          ),
        );
      }).toList(),
    );
  }
}