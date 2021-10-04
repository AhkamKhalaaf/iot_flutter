import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ui/splash_ui.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale("en", ""),
        ],
        locale: const Locale("en", ""), debugShowCheckedModeBanner: false,

    title: 'Flutter iot app ',
        theme: ThemeData( fontFamily: 'The-Sans-Plain',
        primaryColor: HexColor('#30a84c'),accentColor: HexColor('#30a84c'),textTheme: TextTheme(
    headline3: TextStyle(
    color: Colors.black.withOpacity(0.75),
    fontSize: 12.0,
    fontWeight: FontWeight.w700),
    headline4:
    TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 8.0),
    ),
    ),
    home:
    //const HomeUi()
    const SplashUi(),
    );
  }
}

