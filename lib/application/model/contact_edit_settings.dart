import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';

part "contact_edit_settings.freezed.dart";

@freezed
class ContactEditSettings with _$ContactEditSettings {
  const factory ContactEditSettings({
    @Default("") String id,
    required String name,
    @Default(ContactMethod.phone) ContactMethod method,
    @Default("") String value,
  }) = _ContactEditSettings;
}
