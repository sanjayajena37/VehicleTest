import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/models/ClassModel.dart';
import 'package:turbo_vehicle_test/providers/ApiFactory.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class ModelVehicleScreen extends StatefulWidget {
  final MainModel model;

  const ModelVehicleScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _ModelVehicleScreenState createState() => _ModelVehicleScreenState();
}

class _ModelVehicleScreenState extends State<ModelVehicleScreen> {
  List<dynamic> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.GETMETHODCALL(
        api: ApiFactory.VEH_MODEL(
            maker: widget.model.makerVeh,
            classType: widget.model.classVehicleId),
        fun: (List<dynamic> list) {
          setState(() {
            this.list = list;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle Model"),
        titleSpacing: 3,
      ),
      body: Stack(
        children: [
          (list.length != 0)
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(list[index]),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
                      onTap: () {
                        widget.model.modelVehicle=list[index];
                        Navigator.pushNamed(context, "/vehicleFuelType");
                      },
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
