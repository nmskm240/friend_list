import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:table_calendar/table_calendar.dart';

abstract class ISharedPreferencesWrapper {
  CalendarFormat getCalendarForrmat();
  Uint8List getDefaultIcon();
  TimeOfDay getNotificationTime();
  PersonSortOrder getPersonSortOrder();

  Future<void> setDefault();
  void setDefaultIcon(Uint8List icon);
  void setCalendarFormat(CalendarFormat format);
  void setNotificationTime(TimeOfDay time);
  void setPersonSortOrder(PersonSortOrder order);

  Future<void> resetDefaultIcon();
  void resetCalendarFormat();
  void resetNotificationTime();
  void resetPersonSortOrder();
}
