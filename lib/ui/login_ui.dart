import 'package:flutter/material.dart';
import 'package:iotappexam/api/account_apis.dart';
import 'package:iotappexam/common/button_ui.dart';
import 'package:iotappexam/common/text_form_filed_ui.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/lang/demo_localizations.dart';
import 'package:iotappexam/models/Language.dart';
import 'package:iotappexam/values.dart';
import 'package:iotappexam/controllers/setting_controller.dart';
import 'package:flutter_riverpod/all.dart';

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
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Align(alignment:DemoLocalizations.of(context).locale.toString()=='en_US'?Alignment.topRight: Alignment.topLeft,
                  child: DropdownButton(
                      onChanged: (Language? lang){
                        context.read(settingController).changeLanguageLoginUi(lang!);
                        },
                      underline: SizedBox(),
                      icon: Icon(
                        Icons.language,
                        color:appConfig.colorText,
                      ),
                      items: Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                          value: lang,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(lang.name,style: TextStyle(fontSize: 30),),
                              Text(lang.flag),
                            ],
                          ))).toList()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
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
                  getString(context, 'phoneNumber'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: getString(context,  'enterPhoneNumber'),
                  textInputType: TextInputType.phone,
                  hintText:  getString(context, 'phoneNumber'),
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
                  getString(context,'Password'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: securityPass,
                  errorText:  getString(context,'enterPassword'),
                  textInputType: TextInputType.text,
                  hintText:  getString(context,'Password'),
                  textEditingController: passwordText,
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
                   getString(context,  'doYouForget'),
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
                    widget:   Text(
                    getString(context, 'signIn'),
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
                      getString(context,  'signUp'),
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
