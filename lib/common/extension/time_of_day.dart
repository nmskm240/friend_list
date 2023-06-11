import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String to24Hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final minute = this.minute.toString().padLeft(2, "0");
    return "$hour:$minute";
  }

  static TimeOfDay parseFrom24Hours(String s) {
    return TimeOfDay(
      hour: int.parse(s.split(":")[0]),
      minute: int.parse(s.split(":")[1]),
    );
  }
}
