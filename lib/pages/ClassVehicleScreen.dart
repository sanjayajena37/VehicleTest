import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/models/ClassModel.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class ClassVehicleScreen extends StatefulWidget {
  final MainModel model;

  const ClassVehicleScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _ClassVehicleScreenState createState() => _ClassVehicleScreenState();
}

class _ClassVehicleScreenState extends State<ClassVehicleScreen> {
  List<ClassModel> list = [
    ClassModel(id: "4w", name: "Car"),
    ClassModel(id: "2w", name: "Bike"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle Class"),
        titleSpacing: 3,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].name),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
              onTap: () {
                widget.model.classVehicleId=list[index].id;
                widget.model.classVehicleName=list[index].name;
                Navigator.pushNamed(context, "/vehicleMake");
              },
            );
          },
        ),
      ),
    );
  }
}
