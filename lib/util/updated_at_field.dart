import 'package:freezed_annotation/freezed_annotation.dart';

class UpdatedAtField implements JsonConverter<DateTime?, String?> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(String? str) {
    if(str == null) return null;
    return DateTime.tryParse(str)?.toLocal();
  }

  @override
  String? toJson(DateTime? dateTime) {
    return DateTime.now().toUtc().toIso8601String();
  }
}
