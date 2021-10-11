import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iotappexam/common/button_ui.dart';
import 'package:iotappexam/common/text_form_filed_ui.dart';
import 'package:iotappexam/resources/app_config.dart';

class AddDeviceUi extends StatefulWidget {
  const AddDeviceUi({Key? key}) : super(key: key);

  @override
  State<AddDeviceUi> createState() => _AddDeviceUiState();
}

class _AddDeviceUiState extends State<AddDeviceUi> {
  final formKeyAddDevice = GlobalKey<FormState>();
  TextEditingController projectID = TextEditingController();
  TextEditingController cloudRegion = TextEditingController();
  TextEditingController registerID = TextEditingController();
  FocusNode projectIDFocus = FocusNode();
  FocusNode cloudRegionFocus = FocusNode();
  FocusNode registerIdFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    projectIDFocus.dispose();
    cloudRegionFocus.dispose();
    registerIdFocus.dispose();
    projectID.dispose();
    cloudRegion.dispose();
    registerID.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: appConfig.colorMain,
        title: const Text('add device'),
      ),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        color: appConfig.backColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: formKeyAddDevice,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Project Id',
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                TextFormUi(
                  security: false,
                  errorText: 'Enter Project Id',
                  textInputType: TextInputType.number,
                  hintText: 'Project Id',
                  textEditingController: projectID,
                  nextFocusNode: cloudRegionFocus,
                  ownFocusNode: projectIDFocus,
                  //assets/phone.png
                  rightIcon: Icon(
                    Icons.edit,
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
                  'cloud Region',
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: 'Enter cloud Region',
                  textInputType: TextInputType.text,
                  hintText: 'cloud Region',
                  textEditingController: cloudRegion,
                  nextFocusNode: registerIdFocus,
                  ownFocusNode: cloudRegionFocus,
                  //assets/phone.png
                  rightIcon: Icon(
                    Icons.edit,
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
                  'registry Id',
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: 'Enter registry Id',
                  textInputType: TextInputType.text,
                  hintText: 'registry Id',
                  textEditingController: registerID,
                  nextFocusNode: FocusNode(),
                  ownFocusNode: registerIdFocus,
                  //assets/phone.png
                  rightIcon: Icon(
                    Icons.edit,
                    color: appConfig.colorMain,
                  ),
                  leftIcon: const SizedBox(
                    width: 0.0,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
                GestureDetector(
                  onTap: () {
                    if (!formKeyAddDevice.currentState!.validate()) {
                      return;
                    } else {
                      formKeyAddDevice.currentState!.save();
                    }
                    Fluttertoast.showToast(
                        msg: "the device is added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.of(context).pop();
                  },
                  child: ButtonUi(
                    borderColor: appConfig.colorMain,
                    w: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.1,
                    padding: 10.0,
                    widget: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    backColor: appConfig.colorMain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
