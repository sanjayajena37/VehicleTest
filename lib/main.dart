import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:turbo_vehicle_test/pages/FuelTypeVehScreen.dart';
import 'package:turbo_vehicle_test/pages/ProfileVehicleScreen.dart';
import 'package:turbo_vehicle_test/pages/SplashScreen.dart';
import 'package:turbo_vehicle_test/pages/TransmissionScreen.dart';
import 'package:turbo_vehicle_test/pages/ClassVehicleScreen.dart';
import 'package:turbo_vehicle_test/pages/HomePage.dart';
import 'package:turbo_vehicle_test/pages/MakeVehicleScreen.dart';
import 'package:turbo_vehicle_test/pages/ModelVehicleScreen.dart';
import 'package:turbo_vehicle_test/pages/NumberVehicleScreen.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

void main() {
  // runApp(MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (_)=>VehicleListModel()),
  //   ],
  //   child: MyApp(),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MainModel _model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return MaterialApp(
            title: 'Turbo.Care',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(
              model: model,
            ),
            routes: {
              '/vehicleList': (context) => HomePage(
                  model: _model,
                  ),
              '/vehicleNumber': (context) => NumberVehicleScreen(
                    model: _model,
                  ),
              '/vehicleClass': (context) => ClassVehicleScreen(
                    model: _model,
                  ),
              '/vehicleMake': (context) => MakeVehicleScreen(
                    model: _model,
                  ),
              '/vehicleModel': (context) => ModelVehicleScreen(
                    model: _model,
                  ),
              '/vehicleFuelType': (context) => FuelTypeVehScreen(
                    model: _model,
                  ),
              '/vehicleTransmisson': (context) => TransmissionScreen(
                    model: _model,
                  ),
              '/profile': (context) => ProfileVehicleScreen(
                    model: _model,
                  ),
            },
          );
        },
      ),
    );
  }
}
