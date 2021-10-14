import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cashe_hepler.dart';
import 'controllers/setting_controller.dart';
import 'lang/demo_localizations.dart';
import 'ui/home_ui.dart';
import 'ui/splash_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await CacheHelper.init();
  runApp(ProviderScope(child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read(settingController).initLocal();
    return Consumer(
      builder: (context, watch, child) {
        return MaterialApp(
            localizationsDelegates: [
              DemoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English, no country code
              Locale('ar', 'SA'),
            ],
            locale: watch(settingController).appLocale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter iot app ',
            theme: ThemeData(
              fontFamily: 'The-Sans-Plain',
              primaryColor: HexColor('#30a84c'),
              accentColor: HexColor('#30a84c'),
              textTheme: TextTheme(
                headline3: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
                headline4: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 8.0),
              ),
            ),
            home:
          const SplashUi()
            //const HomeUi()
            //const HomeUi(),
            );
      },
    );
  }
}
