import 'dart:async';
import 'package:flutter/material.dart';
import 'login_ui.dart';

class SplashUi extends StatefulWidget {
  const SplashUi({Key? key}) : super(key: key);

  @override
  State<SplashUi> createState() => _SplashUiState();
}

class _SplashUiState extends State<SplashUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginUi()),
            (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/logo.png',
            width: MediaQuery.of(context).size.width * 0.75,
            //  height: MediaQuery.of(context).size.width * 0.5,
          ),
//            Text('Smart Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,
//          color: appConfig.colorText),)
        ],
      )),
    ));
  }
}
