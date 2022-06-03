import 'package:get_storage/get_storage.dart';

class AppSharedPreference {
  static final _getStorage = GetStorage();

  static const _lastNumber = 'last_number';
  static const _lastNumberCode = 'last_number_code';

  static Future<void> setLastNumber(String lastNumber) async => _getStorage.write(_lastNumber, lastNumber);

  static String? get lastNumber => _getStorage.read(_lastNumber) ?? "";

  static Future<void> setLastNumberCode(String lastNumberCode) async => _getStorage.write(_lastNumberCode, lastNumberCode);

  static String? get lastNumberCode => _getStorage.read(_lastNumberCode) ?? "";

  static Future<void> clear() async => _getStorage.erase();
}
