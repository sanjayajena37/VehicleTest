import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/models/ClassModel.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class FuelTypeVehScreen extends StatefulWidget {
  final MainModel model;

  const FuelTypeVehScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _FuelTypeVehScreenState createState() => _FuelTypeVehScreenState();
}

class _FuelTypeVehScreenState extends State<FuelTypeVehScreen> {
  List<String> list = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol+CNG",
    "Electric",
    "Hybrid"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Fuel Type"),
        titleSpacing: 3,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index]),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
              onTap: () {
                widget.model.fuelTypeVeh=list[index];
                Navigator.pushNamed(context, "/vehicleTransmisson");
              },
            );
          },
        ),
      ),
    );
  }
}
