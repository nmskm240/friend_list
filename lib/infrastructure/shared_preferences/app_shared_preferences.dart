import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/common/exception/unregistred_preferences_exception.dart';
import 'package:friend_list/common/extension/time_of_day.dart';
import 'package:friend_list/infrastructure/shared_preferences/i_shared_preferences_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

final sharedPreferences = Provider<AppSharedPreferences>((ref) {
  throw UnimplementedError();
});

enum _SharedPreferencesKey {
  calendarFormat,
  defaultIcon,
  notificationTime,
  personSortOrder,
}

class AppSharedPreferences implements ISharedPreferencesWrapper {
  late final SharedPreferences _preferences;

  AppSharedPreferences();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    final unregisteredKeys = _SharedPreferencesKey.values
        .where((key) => _preferences.get(key.name) == null);
    for (final key in unregisteredKeys) {
      switch (key) {
        case _SharedPreferencesKey.calendarFormat:
          resetCalendarFormat();
          break;
        case _SharedPreferencesKey.defaultIcon:
          await resetDefaultIcon();
          break;
        case _SharedPreferencesKey.notificationTime:
          resetNotificationTime();
          break;
        case _SharedPreferencesKey.personSortOrder:
          resetPersonSortOrder();
          break;
        default:
          throw Exception();
      }
    }
  }

  @override
  Uint8List getDefaultIcon() {
    final key = _SharedPreferencesKey.defaultIcon.name;
    final icon = _preferences.getString(key);
    if (icon == null) {
      throw UnregisteredPreferenceException(key);
    }
    return base64.decode(icon);
  }

  @override
  CalendarFormat getCalendarForrmat() {
    final key = _SharedPreferencesKey.calendarFormat.name;
    final index = _preferences.getInt(key);
    if (index == null) {
      throw UnregisteredPreferenceException(key);
    }
    return CalendarFormat.values.elementAt(index);
  }

  @override
  TimeOfDay getNotificationTime() {
    final key = _SharedPreferencesKey.notificationTime.name;
    final str = _preferences.getString(key);
    if (str == null) {
      throw UnregisteredPreferenceException(key);
    }
    return TimeOfDayExtension.parseFrom24Hours(str);
  }

  @override
  PersonSortOrder getPersonSortOrder() {
    final key = _SharedPreferencesKey.personSortOrder.name;
    final index = _preferences.getInt(key);
    if (index == null) {
      throw UnregisteredPreferenceException(key);
    }
    return PersonSortOrder.values.elementAt(index);
  }

  @override
  void setCalendarFormat(CalendarFormat format) {
    _preferences.setInt(
        _SharedPreferencesKey.calendarFormat.name, format.index);
  }

  @override
  Future<void> setDefault() async {
    resetCalendarFormat();
    await resetDefaultIcon();
    resetNotificationTime();
    resetPersonSortOrder();
  }

  @override
  void setDefaultIcon(Uint8List icon) {
    _preferences.setString(
        _SharedPreferencesKey.defaultIcon.name, base64.encode(icon));
  }

  @override
  void setNotificationTime(TimeOfDay time) {
    _preferences.setString(
        _SharedPreferencesKey.notificationTime.name, time.to24Hours());
  }

  @override
  void setPersonSortOrder(PersonSortOrder order) {
    _preferences.setInt(
        _SharedPreferencesKey.personSortOrder.name, order.index);
  }

  @override
  Future<void> resetDefaultIcon() async {
    final data = await rootBundle.load(Strings.defaultIconPath);
    final buffer = data.buffer;
    final bytes = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    setDefaultIcon(bytes);
  }

  @override
  void resetCalendarFormat() {
    setCalendarFormat(CalendarFormat.month);
  }

  @override
  void resetNotificationTime() {
    setNotificationTime(const TimeOfDay(hour: 10, minute: 0));
  }

  @override
  void resetPersonSortOrder() {
    setPersonSortOrder(PersonSortOrder.added);
  }
}
