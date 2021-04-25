import 'package:scoped_model/scoped_model.dart';
import 'package:turbo_vehicle_test/models/VehicleModel.dart';

class PassData extends Model {
  String numberVeh;
  String classVehicleId;
  String classVehicleName;
  String makerVeh;
  String modelVehicle;
  String fuelTypeVeh;
  String transmissionVeh;

  VehicleModel getModel(){
    return new VehicleModel(numberVeh: numberVeh,classVehicleId: classVehicleId,classVehicleName: classVehicleName,makerVeh: makerVeh,modelVehicle: modelVehicle,fuelTypeVeh: fuelTypeVeh,transmissionVeh:transmissionVeh);
  }

  VehicleModel vehicleModel;
}
