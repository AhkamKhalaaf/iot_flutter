import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iotappexam/models/device_model.dart';

class DevicesApis {
  getDevices() {
    List<Device> devices = [];
    loadLocalDevices() async {
      try {
        String data =
            await rootBundle.loadString('assets/data/data_devices_json.json');
        devices = DeviceModel.fromJson(json.decode(data)).devices;
      } catch (e) {
        print('${e}..........error get devices');
      }
    }
  }

  addDevice(BuildContext context, String projectID, String cloudRegion,
      String registerId) {
    Fluttertoast.showToast(
        msg: "the device is added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.of(context).pop();
  }

  changeDeviceStatus(String deviceID) {}
}
