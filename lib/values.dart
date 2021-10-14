import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'lang/demo_localizations.dart';

showLogoutDialog(BuildContext context,String title,Widget widget,
  Function function
    ) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Scaffold(backgroundColor: Colors.transparent,
          body: Center(
            child: Container(alignment: Alignment.center
              ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white
              ),height: 160.0,width: 250.0,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                widget,
                  SizedBox(height: 10.0,),
                  Text(
                   title,
                    style: TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
                      RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            getString(context, 'yes'),
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onPressed: () {
                            function();
                          }),
                      RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                              getString(context, 'no'),
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],)


                ],
              ),
            ),
          ),)


        ;
      });
}


String getString(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslatedValues(key).toString();
}