class Vehicle {
  final int id; //
  final int km; //
  final String regNum; //
  final String vinNum; //
  final double displacement; //
//   //final List<dynamic> documents;
//   //final List<dynamic> documentsToRemove=null;
//   //final int editDate;
  final String engineNum; //
//   //final int fromDate;
  final double hp; //
//   //final List<dynamic> imgs;//
//   //final List<dynamic> imgsToRemove=null;
  final double kw; //
//   //final Map<String,dynamic> module;
  final int month;
  final int year;
  final VehicleFieldsId primaryFuelType; //
  final VehicleFieldsId secondaryFuelType;
//final dynamic regNumTemplate;
  final double primaryFuelTankCapacity;
  final String secondaryFuelTankCapacity;
  final int startKm;
//  // final dynamic thruDate;
//   //final int tyresToRemove;
  final List<dynamic> vehicleAttributes;
  //final List<Map<String,dynamic>> vehicleAttributesToRemove=null;
  final VehicleFieldsId vehicleBrand;
  final String vehicleBrandName;
//   //final Map<String, dynamic> vehicleDocumentsToRemove=null;
//   //final Map<String, dynamic> vehicleEventsToRemove=null;
//   //final Map<String, dynamic> vehicleFuelLogsToRemove=null;
  final VehicleFieldsId vehicleModel;
  final String vehicleModelName;
  final VehicleFieldsId vehicleType;
//   //final List<dynamic> vehicleUsers;
//   //final List<dynamic> vehicleUsersToRemove=null;
//   //final List<dynamic> workCardsToRemove=null;
//
  Vehicle(this.id, this.km, this.regNum, this.vinNum, this.displacement,
      this.engineNum, this.hp, this.kw, this.month,
      this.year, this.primaryFuelTankCapacity, this.secondaryFuelTankCapacity,
      this.startKm, this.vehicleType, this.vehicleBrand, this.vehicleBrandName, this.vehicleModel,
      this.vehicleModelName, this.primaryFuelType, this.secondaryFuelType, this.vehicleAttributes);

  Map toJson() {
    Map vehicleT = this.vehicleType != null ? this.vehicleType.toJson() : null;
    Map vehicleB = this.vehicleBrand != null ? this.vehicleBrand.toJson() : null;
    Map vehicleM = this.vehicleModel != null ? this.vehicleModel.toJson() : null;
    Map primaryFuelT = this.primaryFuelType != null ? this.primaryFuelType.toJson() : null;
    Map secondaryFuelT = this.secondaryFuelType != null ? this.secondaryFuelType.toJson() : null;
    double secondaryFuelTank = secondaryFuelT !=null ? double.parse(this.secondaryFuelTankCapacity) : null;
    String brandName = this.vehicleBrandName !="" ? this.vehicleBrandName : null;
    String modelName = this.vehicleModelName !="" ? this.vehicleModelName : null;
    return {
      'id': id,
      'km': km,
      'regNum': regNum,
      'vinNum': vinNum,
      'displacement': displacement,
      //'documents':documents,
      //'documentsToRemove':documentsToRemove,
      //'editDate':editDate,
      'engineNum': engineNum,
      //'fromDate':fromDate,
      'hp': hp,
      //'imgs':imgs,
      // 'imgsToRemove':imgsToRemove,
      'kw': kw,
      //'module':module,
      'month': month,
      'primaryFuelType': primaryFuelT,
      'secondaryFuelType': secondaryFuelT,
      //'regNumTamplate':regNumTemplate,
      'primaryFuelTankCapacity': primaryFuelTankCapacity,
      'secondaryFuelTankCapacity': secondaryFuelTank,
      'startKm': startKm,
      //'thruDate':thruDate,
      //'tiresToRemove':tyresToRemove,
      'vehicleAttributes':vehicleAttributes,
      //'vehicleAttributesToRemove':vehicleAttributesToRemove,
      'vehicleBrand':vehicleB,
      'vehicleBrandName':brandName,
      //'vehicleDocumentsToRemove':vehicleDocumentsToRemove,
      //'vehicleEventsToRemove':vehicleEventsToRemove,
      //'vehicleFuelLogsToRemove':vehicleFuelLogsToRemove,
      'vehicleModel':vehicleM,
      'vehicleModelName':modelName,
      'vehicleType':vehicleT,
      //'vehicleUsers':vehicleUsers,
      //'vehicleUsersToRemove':vehicleUsersToRemove,
      //'workCardsToRemove':workCardsToRemove,
      'year': year,
    };
  }
}
class VehicleFieldsId{
  int id;

  VehicleFieldsId(this.id);

  Map toJson() {
    if(id==null){
      id=1;
    }
    return {
      'id': id,
    };
  }
}
