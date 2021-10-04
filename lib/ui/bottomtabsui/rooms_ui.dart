import 'package:flutter/material.dart';
import 'package:iotappexam/resources/app_config.dart';

import 'devices_ui.dart';
class RoomsUi extends StatefulWidget {
  const RoomsUi({Key? key}) : super(key: key);

  @override
  State<RoomsUi> createState() => _RoomsUiState();
}

class _RoomsUiState extends State<RoomsUi> {
  List<String>items=['assets/rooms/bathroom.png','assets/rooms/bed.png','assets/rooms/kitchen.png','assets/rooms/sofa.png'];
  List<String>title=['bathroom','bedrooms','kitchen','living'];
  List<String>description=['2 devices','4 devices','1 devices','5 devices'];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double paddingValue =MediaQuery.of(context).size.width * 0.05;
    return   Container(  color: appConfig.backColor,   width: w,alignment: Alignment.center,
      height:h,
      padding: EdgeInsets.all(paddingValue),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 3 /2.8),
        itemBuilder: (context, index) {
          return GestureDetector(onTap: (){
            //DevicesUi
//            Navigator.push(
//                context, MaterialPageRoute(builder: (BuildContext context) =>
//              DevicesUi(title: title[index]
//
//            )));
          },
            child: Container(color: Colors.white,child: Column(children: [
              Expanded(child: Image.asset(items[index])),
              Text(title[index]),
              Text(description[index])
            ],),),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
