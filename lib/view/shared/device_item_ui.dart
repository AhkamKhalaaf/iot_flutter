import 'package:flutter/material.dart';
import 'package:iotappexam/controllers/app_config.dart';
class DeviceItemUi extends StatefulWidget {
  const DeviceItemUi({Key? key,required this.imagePath,required this.title,required this.description}) : super(key: key);
  final String imagePath;
  final String title;
  final String description;

  @override
  State<DeviceItemUi> createState() => _DeviceItemUiState();
}

class _DeviceItemUiState extends State<DeviceItemUi> {
  bool caseSwitch=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.025),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          ImageIcon(AssetImage(widget.imagePath),size:40.0 ,),
          const SizedBox(width:10.0,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appConfig.colorText),
                  ),
                  Text(
                    'smart device , important',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: appConfig.colorText),
                  )
                ],
              )),
          Switch(
            value: caseSwitch,
            onChanged: (value) {
              setState(() {
                caseSwitch=!caseSwitch;
              });
            },
            activeColor: appConfig.colorMain,
          )
        ],
      ),
    );
  }
}