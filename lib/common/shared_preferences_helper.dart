import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:friend_list/common/constant/config.dart';
import 'package:friend_list/common/exception/unregistred_preferences_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  defaultIcon,
}

class SharedPreferencesHelper {

  static SharedPreferences? _preferences;

  static Future<void> loadOrDefault() async {
    _preferences = await SharedPreferences.getInstance();
    if(_preferences!.getKeys().isEmpty) {
      setDefault();
    }
  }

  static Future<void> setDefault() async {
    final data = await rootBundle.load(Path.defaultIcon);
    final buffer = data.buffer;
    final bytes = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    setDefaultIcon(bytes);
  }

  static void setDefaultIcon(Uint8List bytes) {
    _preferences!.setString(SharedPreferencesKeys.defaultIcon.toString(), base64.encode(bytes));
  }

  static Uint8List getDefaultIcon() {
    var key = SharedPreferencesKeys.defaultIcon.toString();
    var str = _preferences!.getString(key);
    if(str == null) {
      throw UnregisteredPreferenceException(key);
    }
    return base64.decode(str);
  }
}