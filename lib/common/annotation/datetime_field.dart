import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeField implements JsonConverter<DateTime?, String?> {
  const DateTimeField();

  @override
  DateTime? fromJson(String? str) {
    if(str == null) return null;
    return DateTime.tryParse(str)?.toLocal();
  }

  @override
  String? toJson(DateTime? dateTime) {
    if (dateTime == null) return null;
    return dateTime.toUtc().toIso8601String();
  }
}
