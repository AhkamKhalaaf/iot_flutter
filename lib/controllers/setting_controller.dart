import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iotappexam/models/Language.dart';
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
  Future<void>  changeLanguageLoginUi(Language lang) async {
    Locale _temp;
    switch(lang.languageCode){
      case 'en':
        _temp=Locale(lang.languageCode,'US');
        print(lang.languageCode);
        break;
      case 'ar':
        _temp=Locale(lang.languageCode,'SA');

        print(lang.languageCode);
        break;
      default:
        _temp=Locale(lang.languageCode,'US');
        print(lang.languageCode);
    }

    CacheHelper.sharedPreferencesApp!.setString("languageCode",_temp.languageCode);
    CacheHelper.sharedPreferencesApp!.setString("countryCode",_temp.countryCode!);
    appLocale=_temp;
    notifyListeners();

  }
}
