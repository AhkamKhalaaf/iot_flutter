import 'package:flutter/material.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/view/shared/button_ui.dart';
import 'package:iotappexam/view/shared/text_form_filed_ui.dart';
class AddDeviceUi extends StatefulWidget {
  const AddDeviceUi({Key? key}) : super(key: key);

  @override
  State<AddDeviceUi> createState() => _AddDeviceUiState();
}

class _AddDeviceUiState extends State<AddDeviceUi> {
  final formKeyAddDevice = GlobalKey<FormState>();
  TextEditingController nameText = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    phoneFocus.dispose();
    nameText.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(elevation: 0.0,
        backgroundColor: appConfig.colorMain,title: const Text('add device'),),
    body: Container(   padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      color: appConfig.backColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    child: SingleChildScrollView(
      child: Form(key: formKeyAddDevice,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,children: [
          Text('Project Id',style: TextStyle(color: appConfig.colorText),),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          TextFormUi(
            security: false,
            errorText: 'Enter Project Id',
            textInputType: TextInputType.text,
            hintText: 'Project Id',
            textEditingController: nameText,
            nextFocusNode: FocusNode(),
            ownFocusNode: phoneFocus,
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
          Text('cloud Region',style: TextStyle(color: appConfig.colorText),),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.025,
          ),
          TextFormUi(
            security: false,
            errorText: 'Enter cloud Region',
            textInputType: TextInputType.text,
            hintText: 'cloud Region',
            textEditingController: nameText,
            nextFocusNode: FocusNode(),
            ownFocusNode: phoneFocus,
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
          Text('registry Id',style: TextStyle(color: appConfig.colorText),),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.025,
          ),
          TextFormUi(
            security: false,
            errorText: 'Enter registry Id',
            textInputType: TextInputType.text,
            hintText: 'registry Id',
            textEditingController: nameText,
            nextFocusNode: FocusNode(),
            ownFocusNode: phoneFocus,
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
          GestureDetector(onTap: (){
            if (!formKeyAddDevice.currentState!.validate()) {
              return;
            } else {
              formKeyAddDevice.currentState!.save();


            }
          },
            child: ButtonUi(borderColor:appConfig.colorMain ,
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
        ],),
      ),
    ),),));
  }
}
