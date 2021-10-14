import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotappexam/models/device_model_local.dart';

import '../values.dart';

final dataControl =
    ChangeNotifierProvider<DataController>((ref) => DataController());

class DataController extends ChangeNotifier {
  bool showStatus = false;
  List<DeviceModelLocal> devices = [];

  changeStatus(DeviceModelLocal deviceModelLocal) {
    deviceModelLocal.status=!deviceModelLocal.status;
    notifyListeners();
  }

  addDevice(DeviceModelLocal deviceModelLocal) {
    devices.add(deviceModelLocal);
    notifyListeners();
  }

  removeDevice(
      {required BuildContext context,
      required DeviceModelLocal deviceModelLocal}) {
    showLogoutDialog(
        context,
        getString(context, 'deleteText'),
        Icon(FontAwesomeIcons.checkCircle,
            size: 40, color: Theme.of(context).accentColor), () {
      devices.remove(deviceModelLocal);
      notifyListeners();
      Navigator.pop(context);
    });
  }
}
