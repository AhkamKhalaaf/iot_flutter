import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../cashe_hepler.dart';

final settingController =
    ChangeNotifierProvider<SettingController>((ref) => SettingController());

class SettingController extends ChangeNotifier {
  Locale appLocale = Locale('ar');
  initLocal() {
      appLocale = CacheHelper.sharedPreferencesApp!.containsKey('lang')
          ? CacheHelper.sharedPreferencesApp!.getString('lang') != null
              ? Locale(CacheHelper.sharedPreferencesApp!
                  .getString('lang')
                  .toString())
              : Locale('ar')
          : Locale('ar');
      //print('${appLocale},,,,,,,,applocale');
      // print(
      //     '${CacheHelper.sharedPreferencesApp!.getString('lang')},,,,,from shared pref');
      notifyListeners();

    }


  changeLanguage(Locale locale) {
    appLocale = locale;
    CacheHelper.sharedPreferencesApp!.setString('lang', locale.toString());
    notifyListeners();
    //print('${CacheHelper.sharedPreferencesApp!.getString('lang')},,,,,,,,sharedpregferences');
   // print('${appLocale},,,,,,,,applocale');
  }
}
