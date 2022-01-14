import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static  PreferenceHelper? _preferenceHelper;
  static  SharedPreferences? _preferences;

  PreferenceHelper._();

  static Future<PreferenceHelper> getInstance() async {
    if (_preferenceHelper == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = PreferenceHelper._();
      await secureStorage._init();
      _preferenceHelper = secureStorage;
    }
    return _preferenceHelper!;
  }
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }
  // put string
  static Future<bool> putString(String key, String value) {
    if (_preferences == null) return Future.value(false);
    return _preferences!.setString(key, value);
  }

}