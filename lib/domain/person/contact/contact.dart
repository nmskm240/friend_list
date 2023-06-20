// ignore_for_file: prefer_initializing_formals, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part "contact.freezed.dart";
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const Contact._();
  const factory Contact({
    @JsonKey(name: Strings.jsonKeyId) required String id,
    @JsonKey(name: Strings.jsonKeyName) required String name,
    @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
        required ContactMethod method,
    @JsonKey(name: Strings.jsonKeyValue) required String value,
    @JsonKey(name: Strings.jsonKeyPersonId) required String personId,
    @CreatedAtField()
    @JsonKey(name: Strings.jsonKeyCreatedAt)
        DateTime? createdAt,
    @UpdatedAtField()
    @JsonKey(name: Strings.jsonKeyUpdatedAt)
        DateTime? updatedAt,
  }) = _Contact;
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  bool get isValid {
    return id.isNotEmpty &&
        method != ContactMethod.unknown &&
        value.isNotEmpty &&
        personId.isNotEmpty;
  }
}
