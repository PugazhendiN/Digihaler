import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  static final SharedPreferencesSingleton _instance =
      SharedPreferencesSingleton._internal();

  factory SharedPreferencesSingleton() {
    return _instance;
  }

  SharedPreferences? _sharedPreferences;

  SharedPreferencesSingleton._internal();

  Future<SharedPreferences> getSharedPreferences() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences!;
  }

  Future<void> storeUidInSharedPreferences(int uid) async {
    final prefs = await getSharedPreferences();
    prefs.setInt('uid', uid);
  }

  Future<int?> getUidFromSharedPreferences() async {
    final prefs = await getSharedPreferences();
    return prefs.getInt('uid');
  }

  void clearSharedPreferences() async {
    final prefs = await getSharedPreferences();
    prefs.clear();
  }
}
