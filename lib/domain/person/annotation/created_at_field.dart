import 'package:freezed_annotation/freezed_annotation.dart';

class CreatedAtField implements JsonConverter<DateTime?, String?> {
  const CreatedAtField();

  @override
  DateTime? fromJson(String? str) {
    if(str == null) return null;
    return DateTime.tryParse(str)?.toLocal();
  }

  @override
  String? toJson(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return dateTime.toUtc().toIso8601String();
  }
}
