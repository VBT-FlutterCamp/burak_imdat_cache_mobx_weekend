import 'dart:convert';

import '../enums/preferences_key_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vexana/vexana.dart';

class LocaleManager {
  SharedPreferences? _preferences;

  static LocaleManager? _instance;
  static LocaleManager get instance => _instance ??= LocaleManager._init();

  LocaleManager._init() {
    SharedPreferences.getInstance().then(
      (value) => _preferences = value,
    );
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> clearWithoutFirstLogin() async {
    await _preferences?.clear();
    // await setBoolValue(PreferencesKey.firstLoginApp, false);
    return true;
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  Future<void> setStringValue(PreferencesKey key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  Future<void> setIntValue(PreferencesKey key, int value) async {
    await _preferences?.setInt(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKey key, bool value) async {
    await _preferences?.setBool(key.toString(), value);
  }

  Future<void> setDoubleValue(PreferencesKey key, double value) async {
    await _preferences?.setDouble(key.toString(), value);
  }

  Future<void> setListValue(PreferencesKey key, List<String> value) async {
    await _preferences?.setStringList(key.toString(), value);
  }

  Future<void> setDynamicJson<T>(PreferencesKey key, T model) async {
    await _preferences?.setString(key.toString(), jsonEncode(model));
  }

  Future<T> getDynamicModel<T extends INetworkModel>(PreferencesKey key, T model) async {
    final jsonModel = getStringValue(key);
    if (jsonModel.isNotEmpty) {
      return model.fromJson(jsonDecode(jsonModel));
    }
    return model;
  }

  String getStringValue(PreferencesKey key) => _preferences!.getString(key.toString()) ?? '';
  int? getIntValue(PreferencesKey key) => _preferences!.getInt(key.toString());
  bool? getBoolValue(PreferencesKey key) => _preferences!.getBool(key.toString());
}
