import 'package:freezed_annotation/freezed_annotation.dart';

part 'anniversary_edit_settings.freezed.dart';

@freezed
class AnniversaryEditSettings with _$AnniversaryEditSettings {
  const factory AnniversaryEditSettings({
    @Default("") String id,
    required String name,
    DateTime? date,
    @Default(true) bool canDelete,
    @Default(true) bool canChangeName,
  }) = _AnniversaryEditSettings;
}
