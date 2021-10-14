import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:iotappexam/api/account_apis.dart';
import 'package:iotappexam/controllers/app_config.dart';
import 'package:iotappexam/controllers/setting_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotappexam/lang/demo_localizations.dart';
import 'package:iotappexam/ui/splash_ui.dart';
import '../cashe_hepler.dart';
import '../values.dart';

class DrawerSideMenu extends StatelessWidget {
  const DrawerSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: screen.width * 0.75,
      child: Column(

         children: [
          Container(
            padding: EdgeInsets.only(
                left: screen.width * 0.05, right: screen.width * 0.05),
            height: screen.height * 0.275,
            color: appConfig.colorMain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                Align(
                    alignment:DemoLocalizations.of(context).locale.toString()=='en_US'?Alignment.topRight: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
                Center(
                  child: ClipRRect(
                    child: Image.asset(
                      appConfig.imagePath + 'person.png',
                      width: screen.width * 0.25,
                      height: screen.width * 0.25,
                    ),
                    borderRadius: BorderRadius.circular(screen.width),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ahkam khalaf',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),SizedBox(width: 10.0,),
                    Text(
                      '01007640857',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: screen.width * 0.75,
            color: appConfig.backColor,
            alignment: Alignment.centerLeft,
            child: Column(   crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read(settingController).changeLanguage(
                        CacheHelper.sharedPreferencesApp!.getString('lang') ==
                                'ar'
                            ? Locale('en')
                            : Locale('ar'));
                  },
                  child: Text(getString(context, "language_arabic")),
                ),
                SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: () {
                    showLogoutDialog(
                        context,
                        getString(context, 'logOutText'),
                        Icon(FontAwesomeIcons.exclamationCircle,
                            size: 40,
                            color: Theme.of(context).accentColor), () {
                      accountApis.logOut(context);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_sharp,
                        color: appConfig.colorMain,
                      ), SizedBox(width:5.0,),
                      Text('Log Out'),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(screen.width * 0.05),
          ))
        ],
      ),
    );
  }
}
