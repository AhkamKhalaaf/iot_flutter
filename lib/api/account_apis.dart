import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iotappexam/ui/home_ui.dart';
import 'package:iotappexam/ui/splash_ui.dart';
import 'package:iotappexam/values.dart';

class AccountApis {
  //loggedDoneOut
  login(BuildContext context, String phoneNumber, String password) {
    Fluttertoast.showToast(
        msg:getString(context, 'loggedDone'),
        //"you loged  successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeUi()),
        (Route<dynamic> route) => false);
  }
  logOut(BuildContext context ) {
    Fluttertoast.showToast(
        msg:getString(context, 'loggedDoneOut'),
        //"you loged  successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashUi()),
            (Route<dynamic> route) => false);
  }
}

AccountApis accountApis = AccountApis();
