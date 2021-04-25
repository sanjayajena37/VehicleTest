import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:turbo_vehicle_test/providers/AppData.dart';
import 'package:turbo_vehicle_test/scope-models/MainModel.dart';

class SplashScreen extends StatefulWidget {
  final MainModel model;

  const SplashScreen({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    callResourceTimer();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset("assets/turbocare.webp"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/footer.jpg",
                  fit: BoxFit.fitWidth,
                  //height: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void callResourceTimer() {
    Timer(Duration(seconds: 5), navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/vehicleList', (Route<dynamic> route) => false);
  }
}
