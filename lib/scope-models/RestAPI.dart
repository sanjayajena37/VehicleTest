import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:turbo_vehicle_test/utils/Contsants.dart';

class RestAPI extends Model {
  var dio = Dio();

  Map<String, dynamic> failedMap = {
    Const.STATUS: Const.FAILED,
    Const.MESSAGE: Const.NETWORK_ISSUE,
  };

  GETMETHODCALL({@required String api, @required Function fun}) async {
    print("<<>>API CALL>>>>>>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" + api);

    try {
      Response response = await dio.get(api);
      if (response.statusCode == 200) {
        try {
          fun(response.data);
        } catch (e) {
          print("Message is: " + e.toString());
        }
      } else {
        fun(failedMap);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.DEFAULT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.RESPONSE) {
        fun(failedMap);
      }
    }
  }

  POSTMETHOD(
      {@required String api,
      @required Map<String, dynamic> json,
      @required Function fun}) async {
    print("<<>>>>>API CALL>>>>>>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" + api);

    try {
      Response response = await dio.post(api, data: FormData.fromMap(json));
      if (response.statusCode == 200) {
        try {
          print("RESPONSE CALL>>>>" +
              JsonEncoder().convert(response.data).toString());
          fun(response.data);
        } catch (e) {
          print("Message is: " + e.toString());
        }
      } else {
        fun(failedMap);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.DEFAULT) {
        fun(failedMap);
      }
      if (e.type == DioErrorType.RESPONSE) {
        fun(failedMap);
      }
    }
  }
}
