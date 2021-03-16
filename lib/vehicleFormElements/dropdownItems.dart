import 'package:Gara6/vehicleFormElements/vehicleFieldsClasses.dart';
import 'package:flutter/material.dart';
import 'vehicleBrand.dart';
import 'vehicleModel.dart';
import 'vehicleMonth.dart';
import 'vehiclePrimaryFuelType.dart';
import 'vehicleType.dart';
import 'vehicleYear.dart';
import '../getVehicleBrands.dart';
import '../getVehicleModels.dart';
import '../getVehicleType.dart';
import 'formContainer.dart';

class DropdownList extends StatelessWidget{
  final Future<VehicleTypes> types;
  final Future<VehicleBrands> brands;
  final Future<VehicleModels> models;
  final String vehicleType;
  final Function addVehicleType;
  final Function addVehicleBrand;
  final Function addVehicleModel;
  final String brandName;
  final String modelName;
  final int year;
  final int month;
  final String fuelType;
  final Function handleTypeChanged;
  final Function handleBrandChanged;
  final Function handleModelChanged;
  final Function handleYearChanged;
  final Function handleMonthChanged;
  final Function handleFuelTypeChanged;
  final Function changeBrands;
  final Function changeModelsState;
  final bool areBrandsVisible;
  final bool areModelsVisible;
  final TextEditingController brandController;
  final TextEditingController modelController;

  DropdownList(this.types,this.brands,this.models,this.vehicleType, this.addVehicleType, this.brandName, this.addVehicleBrand,
      this.modelName, this.addVehicleModel, this.year, this.month, this.fuelType,  this.handleTypeChanged, this.handleBrandChanged,
      this.handleModelChanged, this.changeBrands, this.changeModelsState, this.handleYearChanged, this.handleMonthChanged,
      this.handleFuelTypeChanged, this.areBrandsVisible,this.areModelsVisible,this.brandController, this.modelController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        VehicleTypeMenu(types,vehicleType, addVehicleType, handleTypeChanged),
        SizedBox(height: 15,),
        areBrandsVisible ?
        Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VehicleBrandMenu(brands,brandName,addVehicleBrand, handleBrandChanged),
                  RaisedButton(
                    onPressed: (){
                      changeBrands(false);
                    },
                    color: Colors.blue,
                    child: Text('Other Brand',style: TextStyle(color: Colors.white),),
                  ),
                ],
              )
        : Column(
            children: [
              TextFormFieldContainer(brandController, 'Vehicle Brand'),
              RaisedButton(
                onPressed: (){
                  changeBrands(true);
                  },
                color: Colors.blue,
                child: Text('Select Brand',style: TextStyle(color: Colors.white),),
              ),
            ],
        ),
        SizedBox(height: 15,),
        if(brandName==null)
          ...[TextFormFieldContainer(modelController, 'Vehicle Model')
          ]
        else if(areModelsVisible && brandName!=null)
          ...[
            TextFormFieldContainer(modelController, 'Vehicle Model'),
            RaisedButton(
              onPressed: (){
                modelController.text='';
                changeModelsState(false);
              },
              color: Colors.blue,
              child: Text('Select Model',style: TextStyle(color: Colors.white),),
            )
          ]
        else ...[ Column(
                  children: [ VehicleModelMenu(models,brandName,modelName, addVehicleModel, handleModelChanged),
                    RaisedButton(
                      onPressed: (){
                        changeModelsState(true);
                      },
                      color: Colors.blue,
                      child: Text('Other Model',style: TextStyle(color: Colors.white),),
                    ),
                  ],
        ),
        ],
        SizedBox(height: 15,),
        VehicleYearDropdown(year,handleYearChanged),
        SizedBox(height: 15,),
        VehicleMonthDropdown(month, handleMonthChanged),
        SizedBox(height: 15,),
        PrimaryFuelType(fuelType,handleFuelTypeChanged),
      ],
    );
  }
}