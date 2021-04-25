import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_vehicle_test/models/VehicleListModel.dart';
import 'package:turbo_vehicle_test/models/VehicleModel.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';


class HomePage extends StatelessWidget {

  MainModel model;
  HomePage({this.model});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VehicleListModel(),
      child: VehicleListScreenState(model: model,),
    );
  }
}
class VehicleListScreenState extends StatelessWidget {

  MainModel model;
  VehicleListScreenState({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle List"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        child: Consumer<VehicleListModel>(
          builder: (context,obj,child){
            return ListView.builder(
                itemCount: obj.vehModel.length,
                itemBuilder: (context,i){
                  return ListTile(
                    title: Text(obj.vehModel[i].numberVeh),
                    subtitle: Text(obj.vehModel[i].makerVeh+" "+obj.vehModel[i].modelVehicle),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
                    onTap: (){
                      model.vehicleModel=obj.vehModel[i];
                      Navigator.pushNamed(context, "/profile");
                    },
                  );
                },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/vehicleNumber").then((value) {
            if(value) {
              VehicleModel vehModel= model.getModel();
              Provider.of<VehicleListModel>(context, listen: false)
                  .addVehicleList(vehModel);
            }
          });
          //Provider.of<VehicleListModel>(context,listen: false).addVehicleGenerateList();
        },
      ),
    );
  }
}

