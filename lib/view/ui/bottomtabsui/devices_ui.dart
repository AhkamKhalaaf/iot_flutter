import 'package:flutter/material.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/view/shared/device_item_ui.dart';


class DevicesUi extends StatefulWidget {
  const DevicesUi({Key? key }) : super(key: key);

  @override
  State<DevicesUi> createState() => _DevicesUiState();
}

class _DevicesUiState extends State<DevicesUi> {
  List<String> items = [
    'assets/devices/alarm.png',
    'assets/devices/lamp.png',
    'assets/devices/smarttv.png'
  ];
  List<String> title = ['alarm', 'lamp', 'smart tv'];

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      color: appConfig.backColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return DeviceItemUi(imagePath: items[index],title: title[index],description: '',);
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
