import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/application/navigation_service.dart';

part 'anniversary_edit_settings.freezed.dart';

@freezed
class AnniversaryEditSettings with _$AnniversaryEditSettings implements RouteRequest {
  const factory AnniversaryEditSettings({
    @Default("") String id,
    required String name,
    DateTime? date,
    @Default(true) bool canDelete,
    @Default(true) bool canChangeName,
  }) = _AnniversaryEditSettings;
}