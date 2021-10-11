import 'package:flutter/material.dart';
import 'package:iotappexam/api/account_apis.dart';
import 'package:iotappexam/common/button_ui.dart';
import 'package:iotappexam/common/text_form_filed_ui.dart';
import 'package:iotappexam/resources/app_config.dart';

import 'home_ui.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController phoneText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  final formKeyLogin = GlobalKey<FormState>();
  bool securityPass = false;

  @override
  void dispose() {
    // TODO: implement dispose
    phoneText.dispose();
    passwordText.dispose();
    phoneFocus.dispose();
    passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    //  height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: 'Enter phone number',
                  textInputType: TextInputType.phone,
                  hintText: 'Phone Number',
                  textEditingController: phoneText,
                  nextFocusNode: passFocus,
                  ownFocusNode: phoneFocus,
                  //assets/phone.png
                  rightIcon: Icon(
                    Icons.phone,
                    color: appConfig.colorMain,
                  ),
                  leftIcon: const SizedBox(
                    width: 0.0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  'Password',
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: securityPass,
                  errorText: 'Enter Password',
                  textInputType: TextInputType.text,
                  hintText: 'Password ',
                  textEditingController: phoneText,
                  nextFocusNode: FocusNode(),
                  ownFocusNode: passFocus,
                  rightIcon: Icon(
                    Icons.lock_outline,
                    color: appConfig.colorMain,
                  ),
                  leftIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          securityPass = !securityPass;
                        });
                      },
                      child: !securityPass
                          ? Icon(
                              Icons.visibility,
                              color: appConfig.colorText.withOpacity(0.75),
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: appConfig.colorText.withOpacity(0.75),
                            )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' do you forget your password ? ',
                    style: TextStyle(color: appConfig.colorMain),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    if (!formKeyLogin.currentState!.validate()) {
                      return;
                    } else {
                      formKeyLogin.currentState!.save();
                      accountApis.login(context, phoneText.text.toString(),
                          passwordText.text.toString());
                    }
                  },
                  child: ButtonUi(
                    borderColor: appConfig.colorMain,
                    w: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.2,
                    padding: 10.0,
                    widget: const Text(
                      'Sign in ',
                      style: TextStyle(color: Colors.white),
                    ),
                    backColor: appConfig.colorMain,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.075,
                ),
                GestureDetector(
                  onTap: () {
//                    if (!formKeyLogin.currentState!.validate()) {
//                      return;
//                    } else {
//                      formKeyLogin.currentState!.save();
//
//                      Navigator.of(context).pushAndRemoveUntil(
//                          MaterialPageRoute(
//                              builder: (context) => const HomeUi()),
//                              (Route<dynamic> route) => false);
//                    }
                  },
                  child: ButtonUi(
                    borderColor: appConfig.colorText,
                    w: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.2,
                    padding: 10.0,
                    widget: Text(
                      'Sign Up ',
                      style: TextStyle(color: appConfig.colorMain),
                    ),
                    backColor: appConfig.colorText,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
