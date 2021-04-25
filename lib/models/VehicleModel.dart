class VehicleModel {
  String numberVeh;
  String classVehicleId;
  String classVehicleName;
  String makerVeh;
  String modelVehicle;
  String fuelTypeVeh;
  String transmissionVeh;

  VehicleModel({
    this.numberVeh,
    this.classVehicleId,
    this.classVehicleName,
    this.makerVeh,
    this.modelVehicle,
    this.fuelTypeVeh,
    this.transmissionVeh,
  });

  String get getNumber => numberVeh;
  String get getClassId => classVehicleId;
  String get getClassName => classVehicleName;
  String get getMaker => makerVeh;
  String get getModel => modelVehicle;
  String get getFueltype => fuelTypeVeh;
  String get getTransmission => transmissionVeh;




}
