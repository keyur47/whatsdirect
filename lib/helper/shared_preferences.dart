import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsdirect/widgets/model.dart';

// class AppSharedPreference {
//   static final _getStorage = GetStorage();
//
//   static const _lastNumber = 'last_number';
//   static const _lastNumberCode = 'last_number_code';
//
//   static Future<void> setLastNumber(List<String> lastNumber) async => _getStorage.write(_lastNumber, lastNumber);
//
//   static List<String> get lastNumber => _getStorage.read('last_number') ?? [];
//
//   static Future<void> setLastNumberCode(String lastNumberCode) async => _getStorage.write(_lastNumberCode, lastNumberCode);
//
//   static String get lastNumberCode => _getStorage.read(_lastNumberCode) ?? "";
//
//   static Future<void> clear() async => _getStorage.erase();
// }


//
class SharedPrefs {

  static final Future<SharedPreferences> prefsData = SharedPreferences.getInstance();




  static Future<void> numberList(List<String> numberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("numberList", numberList);
  }


  static Future<List<String>> getNumberList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("numberList") ?? [];
  }

}


