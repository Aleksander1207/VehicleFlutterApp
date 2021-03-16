import 'package:Gara6/vehicleFormElements/vehicleFieldsClasses.dart';
import 'package:flutter/material.dart';
import 'buttonIcon.dart';
import 'gallery.dart';
import 'vehicleFormElements/checkboxList.dart';
import 'vehicleFormElements/dropdownItems.dart';
import 'vehicleFormElements/fieldLabel.dart';
import 'vehicleFormElements/formContainer.dart';
import 'vehicleFormElements/headline.dart';
import 'vehicleFormElements/incDecSwitcher.dart';
import 'vehicleFormElements/vehiclePrimaryFuelType.dart';
import 'getVehicleBrands.dart';
import 'getVehicleModels.dart';
import 'getVehicleType.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'vehicleFormElements/vehicle.dart';

class VehicleForm extends StatefulWidget {
  final int vehicleId;
  final List<dynamic> vehicleAttributes;
  final Future<VehicleTypes> types;
  final Future<VehicleBrands> brands;
  final Future<VehicleModels> models;

  VehicleForm(this.vehicleId, this.vehicleAttributes, this.types, this.brands, this.models);

  @override
  VehicleFormState createState() => VehicleFormState(vehicleId, vehicleAttributes, types,brands, models);
}

class VehicleFormState extends State<VehicleForm>{
  final int vehicleId;
  final List<dynamic> vehicleAttributes;
  final Future<VehicleTypes> types;
  final Future<VehicleBrands> brands;
  final Future<VehicleModels> models;
  final regNum = TextEditingController();
  final vehicleKm = TextEditingController();
  final vehicleModelController = TextEditingController();
  final vehicleBrandController = TextEditingController();
  final fuelTank = TextEditingController();
  final secondaryFuelTank = TextEditingController();
  final horsePower = TextEditingController();
  final kiloWat = TextEditingController();
  final displacement = TextEditingController();
  final vin = TextEditingController();
  final engineNum = TextEditingController();
  final kmBought = TextEditingController();
  final int kmMax = 2147483647;
  String vehicleType;
  List<VehicleType> vTypes = List<VehicleType>();
  List<VehicleBrand> vBrands = List<VehicleBrand>();
  List<VehicleModel> vModels = List<VehicleModel>();
  String brandName;
  String modelName;
  int year;
  int month;
  String fuelType;
  String secondaryFuelType;
  bool isVisibleFuelType=false;
  bool areVisibleBrands=true;
  bool areVisibleModels=false;
  bool checkBoxTax=false;
  bool checkBoxTechnicalInspection=false;
  bool checkBoxLiabilityInsurance=false;
  bool checkBoxVignette=false;
  bool checkBoxCarInsurance=false;
  var image;
  var vehiclePlaceholder = new AssetImage('images/vehicle_placeholder.jpg');
  List<int> requiredDocuments = List<int>();
  final List<Image> gallery = List<Image>();

  Map<String,int> fuelTypes = {'':0,'Gasoline':1,'Diesel':2,'LPG':3,'Methane':4,'Electric':5,'Hydrogen':6};

  VehicleFormState(this.vehicleId, this.vehicleAttributes, this.types, this.brands, this.models);

  void addVehicleType(VehicleType vType){
    vTypes.add(vType);
  }

  void addVehicleBrand(VehicleBrand vBrand){
    vBrands.add(vBrand);
  }

  void addVehicleModel(VehicleModel vModel){
    vModels.add(vModel);
  }

  void handleTypeChanged(String type){
    setState(() {
      vehicleType=type;
    });
  }

  void handleBrandChanged(String brand){
    setState(() {
      brandName=brand;
      modelName=null;
    });
  }

  void handleModelChanged(String model){
    setState(() {
      modelName=model;
    });
  }

  void changeBrandsState(bool visible){
    setState(() {
      areVisibleBrands=visible;
      brandName=null;
      modelName=null;
    });
  }

  void changeModelsState(bool visible){
    setState(() {
      areVisibleModels = visible;
      modelName=null;
    });
  }

  void handleYearChanged(int selectedYear){
    setState(() {
      year=selectedYear;
    });
  }

  void handleMonthChanged(int selectedMonth){
    setState(() {
      month=selectedMonth;
    });
  }

  void handleFuelTypeChanged(String typeFuel){
    setState(() {
      fuelType=typeFuel;
    });
  }

  void handleSecondaryFuelTypeChanged(String typeFuel){
    setState(() {
      secondaryFuelType=typeFuel;
    });
  }

  void handleTaxCheckbox(bool value){
    setState(() {
      if(value){
        requiredDocuments.add(5);
      }
      else{
        requiredDocuments.remove(5);
      }
      checkBoxTax=value;
    });
  }

  void handleTechnicalInspectionCheckbox(bool value){
    setState(() {
      if(value){
        requiredDocuments.add(1);
      }
      else{
        requiredDocuments.remove(1);
      }
      checkBoxTechnicalInspection=value;
    });
  }
  void handleLiabilityInsuranceCheckbox(bool value){
    setState(() {
      if(value){
        requiredDocuments.add(2);
      }
      else{
        requiredDocuments.remove(2);
      }
      checkBoxLiabilityInsurance=value;
    });
  }
  void handleCarInsuranceCheckbox(bool value){
    setState(() {
      if(value){
        requiredDocuments.add(3);
      }
      else{
        requiredDocuments.remove(3);
      }
      checkBoxCarInsurance=value;
    });
  }
  void handleVignetteCheckbox(bool value){
    setState(() {
      if(value){
        requiredDocuments.add(4);
      }
      else{
        requiredDocuments.remove(4);
      }
      checkBoxVignette=value;
    });
  }

  void uploadImage() async{
    final picker = ImagePicker();
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
        image = pickedImage.path;
    });
  }

  void deleteData(){}

  int getTypeId(){
    for(int i=0;i<vTypes.length;i++){
      if(vehicleType==vTypes[i].code){
        return vTypes[i].id;
      }
    }
    return 0;
  }

  int getBrandId(){
    for(int i=0;i<vBrands.length;i++){
      if(brandName==vBrands[i].name){
        return vBrands[i].id;
      }
    }
    return null;
  }

  int getModelId(){
    for(int i=0;i<vModels.length;i++){
      if(modelName==vModels[i].name){
        return vModels[i].id;
      }
    }
    return null;
  }

  String addDocumentValue(){
    String value ="";
    for(int i=0;i<requiredDocuments.length;i++){
      value+=requiredDocuments[i].toString();
      value+=',';
    }
    return value;
  }

  void saveData(){

    // Map vehicleAttr = Map.from(vehicleAttributes[0]);
    // String valueDocuments = addDocumentValue();
    // vehicleAttr['value'] = valueDocuments;
    // List<dynamic> finalVehicleAttributes = [vehicleAttr];
    // int typeId = getTypeId();
    // VehicleFieldsId vehicleTypeId = VehicleFieldsId(typeId);
    // int brandId = getBrandId();
    // VehicleFieldsId vehicleBrandId = VehicleFieldsId(brandId);
    // int modelId = getModelId();
    // VehicleFieldsId vehicleModelId = VehicleFieldsId(modelId);
    //
    // VehicleFieldsId primaryFuelTypeId = VehicleFieldsId(fuelTypes[fuelType]);
    // VehicleFieldsId secondaryFuelTypeId = secondaryFuelType!=null ? VehicleFieldsId(fuelTypes[secondaryFuelType]) : null;
    //
    // Vehicle vehicle = Vehicle(vehicleId, int.parse(vehicleKm.text), regNum.text, vin.text, double.parse(displacement.text),
    // engineNum.text, double.parse(horsePower.text),double.parse(kiloWat.text), month, year,
    // double.parse(fuelTank.text), secondaryFuelTank.text, int.parse(kmBought.text),
    // vehicleTypeId, vehicleBrandId, vehicleBrandController.text, vehicleModelId,
    //     vehicleModelController.text, primaryFuelTypeId, secondaryFuelTypeId, finalVehicleAttributes);
    //
    // String vehicleJson = jsonEncode(vehicle);
    // print(vehicleJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle')
      ),
      body: ListView(
        children: [
            Container(
              margin: EdgeInsets.all(10),
              color:Colors.grey[500],
              child: Headline('General Info'),
            ),
          Container(
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(width:3.0,color: Colors.blue,),
                  ),
                  child: image!=null ? Image.file(File(image)) : Image(
                    image: vehiclePlaceholder,
                    fit: BoxFit.fill,
                   )
                ),
          image!=null ? Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonIcon(uploadImage,Icons.image),
              SizedBox(width:20),
              ButtonIcon((){setState(() {
                image=null;
              });}, Icons.delete)
            ],
          )
          :Center(
            child: ButtonIcon(uploadImage,Icons.image)
          ),
                SizedBox(height:20),
                TextFormFieldContainer(regNum, 'Registration Number'),
                TextFormFieldContainer(vehicleKm, 'Vehicle Km'),
                DropdownList(types, brands, models, vehicleType, addVehicleType, brandName, addVehicleBrand, modelName,
                    addVehicleModel, year, month, fuelType, handleTypeChanged, handleBrandChanged, handleModelChanged,
                     changeBrandsState, changeModelsState, handleYearChanged, handleMonthChanged, handleFuelTypeChanged,
                    areVisibleBrands, areVisibleModels, vehicleBrandController, vehicleModelController),
                SizedBox(height:10),
                FieldLabel('Primary Fuel Tank, l'),
                IncrementDecrementSwitcher(fuelTank, 200, 0),
                isVisibleFuelType ?
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FieldLabel('Secondary Fuel Type'),
                            SizedBox(width:20,),
                            RaisedButton(onPressed: (){
                              setState(() {
                                isVisibleFuelType=false;
                                secondaryFuelType=null;
                                secondaryFuelTank.text = null;
                              });
                            },
                              color: Colors.blue,
                              child: Text('Remove',style: TextStyle(color: Colors.white),),),
                          ],
                        ),
                        PrimaryFuelType(secondaryFuelType,handleSecondaryFuelTypeChanged),
                        SizedBox(height:20,),
                        FieldLabel('Secondary Fuel Tank, l'),
                        IncrementDecrementSwitcher(secondaryFuelTank, 200, 0),
                      ],)
                : Center(
                  child:RaisedButton(
                    onPressed: (){
                      setState(() {
                        isVisibleFuelType=true;
                      });
                    },
                    color: Colors.blue,
                    child:Text('Add Secondary Fuel Type',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ),
                ),
                  SizedBox(height: 30,),
                  FieldLabel('Engine power, hp'),
                  IncrementDecrementSwitcher(horsePower, 400, 0),
                  SizedBox(height: 20,),
                  FieldLabel('Engine power, kW'),
                  IncrementDecrementSwitcher(kiloWat, 400, 0),
                  SizedBox(height: 20,),
                  FieldLabel('Displacement, sm3'),
                  IncrementDecrementSwitcher(displacement, 400, 0),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left:50,right: 50,top:20,bottom: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'VIN'
                          ),
                          controller: vin,
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 17,
                        ),
                      ),
                  Container(
                    margin: EdgeInsets.only(left:50,right: 50,top:20,bottom: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Engine Number'
                          ),
                          controller: engineNum,
                          textCapitalization: TextCapitalization.characters,
                        ),
                      ),
                      SizedBox(height: 10,),
                      FieldLabel('Bought km'),
                      IncrementDecrementSwitcher(kmBought, kmMax, 0),
          Headline('Required Documents'),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child:  Text('Select required document for this vehicle.'
                            ' They are going to appear in the vehicle main page. All documents can be found in the archive.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 3.0),
                  ),
                  child: Column(
                    children: [
                      CheckboxList(checkBoxTax, 'Tax',handleTaxCheckbox),
                      CheckboxList(checkBoxTechnicalInspection, 'Annual technical inspection',handleTechnicalInspectionCheckbox),
                      CheckboxList(checkBoxLiabilityInsurance, 'Third-party liability insurance',handleLiabilityInsuranceCheckbox),
                      CheckboxList(checkBoxCarInsurance, 'Car Insurance',handleCarInsuranceCheckbox),
                      CheckboxList(checkBoxVignette, 'Vignette',handleVignetteCheckbox),
                    ],
                  ),
                ),
          Center(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gallery(gallery),),
                );
              },
              color: Colors.blue,
              child:Text('Gallery',style:TextStyle(color: Colors.white)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                width: 100,
                height: 45,
                child: ButtonIcon(deleteData,Icons.delete),
              ),
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                width: 100,
                height: 45,
                child: ButtonIcon(null, Icons.cancel),
              ),
              SizedBox(width: 20,),
              Container(
                margin: EdgeInsets.only(top:20,bottom: 20),
                width: 100,
                height: 45,
                child: ButtonIcon(saveData,Icons.save),
              ),
            ],
          )
        ],
      ),
    );
  }
}