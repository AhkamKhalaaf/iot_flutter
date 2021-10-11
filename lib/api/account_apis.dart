import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iotappexam/ui/home_ui.dart';

class AccountApis {
  login(BuildContext context, String phoneNumber, String password) {
    Fluttertoast.showToast(
        msg: "you loged  successfully",
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
}

AccountApis accountApis = AccountApis();
