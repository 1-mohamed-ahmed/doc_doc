import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences sharedPreferences;
  CacheHelper({required this.sharedPreferences});

  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return false;
  }

  // read data
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // remove data dependency key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // Remove All Data from cach
  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  // Are the key exist ?
  bool containsKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
