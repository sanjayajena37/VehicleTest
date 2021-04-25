import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_vehicle_test/models/ClassModel.dart';
import 'package:turbo_vehicle_test/models/VehicleListModel.dart';
import 'package:turbo_vehicle_test/models/VehicleModel.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class TransmissionScreen extends StatefulWidget {
  final MainModel model;

  const TransmissionScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _TransmissionScreenState createState() => _TransmissionScreenState();
}

class _TransmissionScreenState extends State<TransmissionScreen> {
  List<String> list = [
    "Manual",
    "Automatic",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Transmission"),
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
                widget.model.transmissionVeh=list[index];
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context,true);
              },
            );
          },
        ),
      ),
    );
  }
}
