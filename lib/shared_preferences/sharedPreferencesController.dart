import 'package:shared_preferences/shared_preferences.dart';

enum keyPref {
  email,
  loginIn,
}

class SharedPreferencesController {
  static final SharedPreferencesController _instance =
      SharedPreferencesController._();
  late SharedPreferences _sharedPreferences;

  SharedPreferencesController._();

  factory SharedPreferencesController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email}) async {
    await _sharedPreferences.setBool(keyPref.loginIn.toString(), true);
    await _sharedPreferences.setString(keyPref.email.toString(), email);
  }

  bool get loginIn =>
      _sharedPreferences.getBool(keyPref.loginIn.toString()) ?? false;

  String get email =>
      _sharedPreferences.getString(keyPref.email.toString()) ?? '';

  Future<bool> remove({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return await _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}

// class H {
//   // H h = H();
//   factory() {
//     //return H();
//     return F();
//   }
// }
//
// class F extends H {}
