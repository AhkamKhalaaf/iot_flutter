import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iotappexam/common/device_item_ui.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/controllers/data_controller.dart';
import 'package:iotappexam/values.dart';

class DevicesUi extends StatefulWidget {
  const DevicesUi({Key? key}) : super(key: key);

  @override
  State<DevicesUi> createState() => _DevicesUiState();
}

class _DevicesUiState extends State<DevicesUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  loadLocalDevices();
  }

  late double paddingValue;

  @override
  Widget build(BuildContext context) {
    paddingValue = MediaQuery.of(context).size.width * 0.05;
    return Consumer(builder: (context, watch, child) {
      return Container(
        padding: EdgeInsets.all(paddingValue),
        color: appConfig.backColor,
        width: appConfig.w,
        height: appConfig.h,
        child: watch(dataControl).devices.length > 0
            ? ListView.builder(
                itemCount: watch(dataControl).devices.length,
                itemBuilder: (context, index) {
                  return DeviceItemUi(
                     deviceModelLocal: watch(dataControl).devices[index],
                  );
                })
            : Center(
                child: Text(getString(context, 'noDataFound')),
              ),
      );
    });
  }
}
