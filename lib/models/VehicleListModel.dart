import 'package:flutter/cupertino.dart';
import 'package:turbo_vehicle_test/models/VehicleModel.dart';
import 'package:flutter/foundation.dart';

class VehicleListModel with ChangeNotifier, DiagnosticableTreeMixin {
  List<VehicleModel> vehModel = [];

  addVehicleList(VehicleModel model) {
    vehModel.add(model);
    notifyListeners();
  }
}
