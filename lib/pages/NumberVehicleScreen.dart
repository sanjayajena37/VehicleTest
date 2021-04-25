import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/providers/ApiFactory.dart';
import 'package:turbo_vehicle_test/providers/AppData.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';
import 'package:turbo_vehicle_test/widgets/MyWidgets.dart';

class NumberVehicleScreen extends StatefulWidget {
  final MainModel model;

  const NumberVehicleScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _NumberVehicleScreenState createState() => _NumberVehicleScreenState();
}

class _NumberVehicleScreenState extends State<NumberVehicleScreen> {
  TextEditingController _numberCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_numberCont.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new vehicle profile"),
        titleSpacing: 3,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [MyWidgets.formField("Vehicle Number", _numberCont)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          if (_numberCont.text == "") {
            AppData.showInSnackBar(context, "Please enter vehicle number");
          } else {
            widget.model.numberVeh=_numberCont.text;
            Navigator.pushNamed(context, "/vehicleClass");
          }
        },
      ),
    );
  }
}
