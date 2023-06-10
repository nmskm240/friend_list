import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/common/exception/unregistred_preferences_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

enum SharedPreferencesKeys {
  defaultIcon,
  calendarFormat,
}

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future<void> loadOrDefault() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.getKeys().isEmpty) {
      setDefault();
    }
    if (!_preferences!.containsKey(SharedPreferencesKeys.defaultIcon.name)) {
      final data = await rootBundle.load(Strings.defaultIconPath);
      final buffer = data.buffer;
      final bytes = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      setDefaultIcon(bytes);
    }
    if (!_preferences!.containsKey(SharedPreferencesKeys.calendarFormat.name)) {
      setCalendartFormat(CalendarFormat.month);
    }
  }

  static Future<void> setDefault() async {
    final data = await rootBundle.load(Strings.defaultIconPath);
    final buffer = data.buffer;
    final bytes = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    setDefaultIcon(bytes);
    setCalendartFormat(CalendarFormat.month);
  }

  static void setCalendartFormat(CalendarFormat format) {
    _preferences!
        .setInt(SharedPreferencesKeys.calendarFormat.name, format.index);
  }

  static CalendarFormat getCalendarForrmat() {
    final key = SharedPreferencesKeys.calendarFormat.name;
    final index = _preferences!.getInt(key);
    if (index == null) {
      throw UnregisteredPreferenceException(key);
    }
    return CalendarFormat.values.elementAt(index);
  }

  static void setDefaultIcon(Uint8List bytes) {
    _preferences!.setString(
        SharedPreferencesKeys.defaultIcon.toString(), base64.encode(bytes));
  }

  static Uint8List getDefaultIcon() {
    var key = SharedPreferencesKeys.defaultIcon.toString();
    var str = _preferences!.getString(key);
    if (str == null) {
      throw UnregisteredPreferenceException(key);
    }
    return base64.decode(str);
  }
}
