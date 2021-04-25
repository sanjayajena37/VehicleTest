import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/models/ClassModel.dart';
import 'package:turbo_vehicle_test/models/VehicleModel.dart';
import 'package:turbo_vehicle_test/providers/ApiFactory.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class ProfileVehicleScreen extends StatefulWidget {
  final MainModel model;

  const ProfileVehicleScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _ProfileVehicleScreenState createState() => _ProfileVehicleScreenState();
}

class _ProfileVehicleScreenState extends State<ProfileVehicleScreen> {


  VehicleModel vehicleModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      vehicleModel=widget.model.vehicleModel;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Profile"),
        titleSpacing: 3,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.deepPurple,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleModel.modelVehicle+" "+vehicleModel.fuelTypeVeh,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 29),
                ),
                SizedBox(height: 3,),
                Text(
                  vehicleModel.numberVeh,
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: getChild("MAKE", vehicleModel.makerVeh)),
              Expanded(child: getChild("MODEL", vehicleModel.modelVehicle)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: getChild("FUEL TYPE", vehicleModel.fuelTypeVeh)),
              Expanded(child: getChild("TRANSMISSION", vehicleModel.transmissionVeh)),
            ],
          ),
        ],
      ),
    );
  }

  Widget getChild(String title, String subtitle) {
    return Container(
      height: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5,),
            Text(
              subtitle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
