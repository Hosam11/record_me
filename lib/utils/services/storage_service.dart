import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String emailKey = "email";
const String idKey = 'id';
const String tokenKey = "token";
const String nameKey = "token";

const String notFoundPref = 'not found';

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  String getString(String key) => _prefs.getString(key) ?? notFoundPref;
}
