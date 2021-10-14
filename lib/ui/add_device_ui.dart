import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iotappexam/common/button_ui.dart';
import 'package:iotappexam/common/text_area_form_ui.dart';
import 'package:iotappexam/common/text_form_filed_ui.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/controllers/data_controller.dart';
import 'package:iotappexam/models/device_model_local.dart';

import '../values.dart';

class AddDeviceUi extends StatefulWidget {
  const AddDeviceUi({Key? key}) : super(key: key);

  @override
  State<AddDeviceUi> createState() => _AddDeviceUiState();
}

class _AddDeviceUiState extends State<AddDeviceUi> {
  final formKeyAddDevice = GlobalKey<FormState>();
  final deviceName = TextEditingController();
  final projectID = TextEditingController();
  final cloudRegion = TextEditingController();
  final registerID = TextEditingController();
  final descriptionDevice = TextEditingController();
  final deviceNameFocus = FocusNode();
  final projectIDFocus = FocusNode();
  final cloudRegionFocus = FocusNode();
  final registerIdFocus = FocusNode();
  final descriptionFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    deviceName.dispose();
    deviceNameFocus.dispose();
    projectIDFocus.dispose();
    cloudRegionFocus.dispose();
    registerIdFocus.dispose();
    projectID.dispose();
    cloudRegion.dispose();
    registerID.dispose();
    descriptionDevice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,centerTitle: true,
        backgroundColor: appConfig.colorMain,
        title:   Text(getString(context, 'addDevice')),
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
                  getString(context, 'deviceName'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: getString(context, 'enterDeviceName'),
                  textInputType: TextInputType.text,
                  hintText: getString(context, 'deviceName'),
                  textEditingController: deviceName,
                  nextFocusNode: projectIDFocus,
                  ownFocusNode: deviceNameFocus,
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
                  getString(context, 'projectId'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: getString(context, 'enterProjectId'),
                  textInputType: TextInputType.number,
                  hintText:getString(context, 'projectId'),
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
                  getString(context, 'cloudRegion'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: getString(context, 'enterCloudRegion'),
                  textInputType: TextInputType.text,
                  hintText: getString(context, 'cloudRegion'),
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
                  getString(context, 'registryId'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                TextFormUi(
                  security: false,
                  errorText: getString(context, 'enterRegistryId'),
                  textInputType: TextInputType.number,
                  hintText: getString(context, 'registryId'),
                  textEditingController: registerID,
                  nextFocusNode: descriptionFocus,
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
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                 getString(context, 'descriptionDevice'),
                  style: TextStyle(color: appConfig.colorText),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                textAreaFormUi(
                  maxLines: 4,
                  minLines: 4,
                  security: false,
                  errorText: getString(context, 'enterDescriptionDevice'),
                  textInputType: TextInputType.text,
                  hintText: getString(context, 'descriptionDevice'),
                  textEditingController: descriptionDevice,
                  nextFocusNode: FocusNode(),
                  ownFocusNode: descriptionFocus,
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
                    DeviceModelLocal deviceModelLocal = DeviceModelLocal(
                        projectId: projectID.text.toString(),
                        cloudRegion: cloudRegion.text.toString(),
                        description: descriptionDevice.text.toString(),
                        deviceName: deviceName.text.toString(),
                        registerID: registerID.text.toString());
                    context.read(dataControl).addDevice(deviceModelLocal);

                    Navigator.pop(context);
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
