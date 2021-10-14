import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/values.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({Key? key}) : super(key: key);

  @override
  _ProfileUiState createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      color: appConfig.backColor,
      padding: EdgeInsets.all(screen.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screen.width),
                      border:
                          Border.all(color: appConfig.colorMain, width: 1.0)),
                  child: ClipRRect(
                    child: image != null
                        ? Image.file(
                            File(image!.path),
                            width: screen.width * 0.3,
                            height: screen.width * 0.3,
                          )
                        : Image.asset(
                            appConfig.imagePath + 'person.png',
                            width: screen.width * 0.3,
                            height: screen.width * 0.3,
                          ),
                    borderRadius: BorderRadius.circular(screen.width),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: screen.width * 0.125 + 25.0,
                  child: GestureDetector(
                    onTap: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(1.0),
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: appConfig.colorMain, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: screen.width * 0.125,
          ),
          Row(
            children: [
              Expanded(flex: 2,
                child: Text(
                  getString(context, 'name'),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                ),
              ),
              SizedBox(
                width: screen.width * 0.1,
              ),
              Expanded(flex: 3,
                  child: Text(
                'ahkam khalaf mohamed',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0,),textAlign: TextAlign.left,
              ))
            ],
          ),
          SizedBox(
            height: screen.width * 0.025,
          ),
          Row(
            children: [
              Expanded(flex:2,
                child: Text(
                  getString(context, 'phoneNumber'),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                ),
              ),
              SizedBox(
                width: screen.width * 0.1,
              ),
              Expanded(flex: 3,
                  child: Text(
                '01007640857',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ))
            ],
          ),
          SizedBox(
            height: screen.width * 0.025,
          ),
          Row(
            children: [
              Expanded(flex: 2,
                child: Text(
                getString(context, 'deviceNo'),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                ),
              ),
              SizedBox(
                width: screen.width * 0.1,
              ),
              Expanded(flex: 3,
                  child: Text(
                '3 device',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
              ))
            ],
          )
        ],
      ),
    );
  }
}
