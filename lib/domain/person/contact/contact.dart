// ignore_for_file: prefer_initializing_formals

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: Strings.jsonKeyId)
  late final String id;
  @JsonKey(name: Strings.jsonKeyName)
  late String name;
  @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
  late ContactMethod method;
  @JsonKey(name: Strings.jsonKeyValue)
  late String value;
  @JsonKey(name: Strings.jsonKeyPersonId)
  late String personId;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  late final DateTime updatedAt;

  Contact({
    required this.id,
    required this.name,
    required this.method,
    required this.value,
    required this.personId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  bool get isValid {
    return id.isNotEmpty &&
        name.isNotEmpty &&
        method != ContactMethod.unknown &&
        value.isNotEmpty &&
        personId.isNotEmpty;
  }
}
