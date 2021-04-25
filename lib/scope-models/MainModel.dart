import 'package:scoped_model/scoped_model.dart';
import 'package:turbo_vehicle_test/scope-models/RestAPI.dart';
import 'PassData.dart';



class MainModel extends Model with  RestAPI,PassData {}
