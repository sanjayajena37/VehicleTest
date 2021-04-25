import 'dart:async';
import 'dart:math';
import 'dart:convert' show base64, utf8;
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppData {

  static String defaultImgUrl =
      'https://thumbs.dreamstime.com/b/faceless-businessman-avatar-man-suit-blue-tie-human-profile-userpic-face-features-web-picture-gentlemen-85824471.jpg';

  static Color newColor = Color(0xFF7c48ed);
  static Color deepPurple = Colors.deepPurple;
  static String currentSelectedValue = "+91";
  static String currency = "₹";
  static List<String> phoneFormat = [
    "+91" /*, "+80", "+78"*/
  ];
  static String selectedLanguage;

  static setSelectedLan(lan) {
    selectedLanguage = lan;
  }

  static setSelectedLanCode(code) {
    (code == "en") ? selectedLanguage = "English" : selectedLanguage = "ଓଡିଆ";
  }

  static getColor(String code) {
    (code == "en") ? selectedLanguage = "English" : selectedLanguage = "ଓଡିଆ";
  }


  static double properSafeArea(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return availableHeight;
  }


  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static buildDefaultText(String name) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.grey[700]),
    );
  }

  static buildSmallText(String name) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
    );
  }

  static TextStyle defaultTextStyle() {
    return TextStyle(
        fontSize: 15.0, color: Colors.grey[700], fontWeight: FontWeight.w400);
  }

  static TextStyle defaultHintTextStyle() {
    return TextStyle(
        fontSize: 15.0, color: Colors.grey[400], fontWeight: FontWeight.w400);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void showInternetError(
      BuildContext context, Function closeApp, Function retryInternet) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(
            "No Internet..!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
          content: Text(
            "There may be a problem in your internet connection. Please try again!",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16.0,
                height: 1.5,
                fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                "Cancel".toUpperCase(),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                closeApp();
              },
            ),
            FlatButton(
              child: Text(
                "Retry".toUpperCase(),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                retryInternet();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showAlertDialog(BuildContext context, String btnName,
      String title, String message, Function function) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            content: Text(
              message,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.0,
                  height: 1.5,
                  fontWeight: FontWeight.w400),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text(
                  btnName.toUpperCase(),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  function();
                },
              ),
            ],
          );
        });
  }

  static Future<bool> showConfirmationAlertDialog(
      BuildContext context,
      String btnName,
      String btnNegName,
      String title,
      String message,
      Function closePopUp,
      Function function) {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
              content: Text(
                message,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16.0,
                    height: 1.5,
                    fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  child: Text(
                    btnName.toUpperCase(),
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    function();
                  },
                ),
                FlatButton(
                  child: Text(
                    btnNegName.toUpperCase(),
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    closePopUp();
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static void showInSnackBar(BuildContext context, String value) {

    Flushbar(
      //  title:  "Hey SuperHero",
      message: value,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 6),
    )..show(context);
  }

  static void showInSnackDone(BuildContext context, String value) {
    Flushbar(
      //  title:  "Hey SuperHero",
      message: value,

      backgroundColor: Colors.lightGreen,
      duration: Duration(seconds: 6),
    )..show(context);
  }

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  static String getExt(String file) {
    String _fileName = file != null ? file.split('/').last : '...';
    var pos = _fileName.lastIndexOf('.');
    String extName = (pos != -1) ? _fileName.substring(pos + 1) : _fileName;
    print(extName);
    return extName;
  }

  static String getFileName(String file) {
    return file != null ? file.split('/').last : '...';
  }

  static String base64Encd(String data) {
    return base64.encode(utf8.encode(data));
  }

}
