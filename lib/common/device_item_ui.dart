import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/controllers/data_controller.dart';
import 'package:iotappexam/models/device_model_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceItemUi extends StatelessWidget {
  const DeviceItemUi({Key? key,required this.deviceModelLocal}) : super(key: key);
  final DeviceModelLocal deviceModelLocal;
  @override
  Widget build(BuildContext context) {

    return Consumer(builder: (context,watch,child){
      return Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            ImageIcon(
              AssetImage('assets/devices/lamp.png'),
              size: 40.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      deviceModelLocal.deviceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: appConfig.colorMain),
                    ),
                    Text(
                      deviceModelLocal.description,
                      style: TextStyle(fontSize: 12.0, color: appConfig.colorText),
                    )
                  ],
                )),
            const SizedBox(
              width: 10.0,
            ),GestureDetector(onTap: (){
              context.read(dataControl).removeDevice(context: context,deviceModelLocal:deviceModelLocal);

            },child: Icon(Icons.delete,color: appConfig.colorText,),),
            Switch(
              //showStatus
              value: deviceModelLocal.status,
              onChanged: (value) {
                context.read(dataControl).changeStatus(deviceModelLocal);

                // Fluttertoast.showToast(
                //     msg: "the device status is changed successfully",
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.BOTTOM,
                //     timeInSecForIosWeb: 1,
                //     backgroundColor: Colors.green,
                //     textColor: Colors.white,
                //     fontSize: 16.0);
              },
              activeColor: appConfig.colorMain,
            )
          ],
        ),
      );
    },);
    ;
  }
}

