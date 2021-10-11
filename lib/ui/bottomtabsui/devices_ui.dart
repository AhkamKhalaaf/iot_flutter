import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iotappexam/common/device_item_ui.dart';
import 'package:iotappexam/models/device_model.dart';
import 'package:iotappexam/resources/app_config.dart';

class DevicesUi extends StatefulWidget {
  const DevicesUi({Key? key}) : super(key: key);

  @override
  State<DevicesUi> createState() => _DevicesUiState();
}

class _DevicesUiState extends State<DevicesUi> {
  List<Device> devices = [];

  loadLocalDevices() async {
    try {
      String data =
          await rootBundle.loadString('assets/data/data_devices_json.json');
      devices = DeviceModel.fromJson(json.decode(data)).devices;
      setState(() {});
      print('${devices.length}..........length');
    } catch (e) {
      print('${e}..........error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLocalDevices();
  }

  late double paddingValue;

  @override
  Widget build(BuildContext context) {
    paddingValue = MediaQuery.of(context).size.width * 0.05;
    return Container(
      padding: EdgeInsets.all(paddingValue),
      color: appConfig.backColor,
      width: appConfig.w,
      height: appConfig.h,
      child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return DeviceItemUi(
              imagePath: devices[index].imagePath,
              title: devices[index].name,
              description: devices[index].description,
            );
          }),
    );
//      SafeArea(
//        child: Scaffold(
//            appBar: AppBar(
//              elevation: 0.0,titleSpacing: 0.0,
//              backgroundColor: appConfig.colorMain,centerTitle: true,
//              title: Text(
//                widget.title,
//                style: const TextStyle(
//                    color: Colors.white,
//                    fontSize: 18.0,
//                    fontWeight: FontWeight.bold),
//                textAlign: TextAlign.center,
//              ),
//              actions:   [
//              GestureDetector(onTap: (){
//                //AddDeviceUi
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (BuildContext context) =>
//                    const AddDeviceUi()));
//              },child: const Icon(Icons.add,color: Colors.white,size: 35.0,))],
//            ),
//            backgroundColor: appConfig.backColor,
//            body: Container(
//              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
//              color: appConfig.backColor,
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              child: ListView.builder(
//                  itemCount: items.length,
//                  itemBuilder: (context, index) {
//                    return DeviceItemUi(imagePath: items[index],title: title[index],description: '',);
//                  }),
//            )));
  }
}
