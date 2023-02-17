// ignore_for_file: prefer_initializing_formals

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(name: "id")
  late final String id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "method")
  late ContactMethod method;
  @JsonKey(name: "value")
  late String value;
  @JsonKey(name: "person_id")
  late String personId;
  @CreatedAtField()
  @JsonKey(name: "created_at")
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: "updated_at")
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
}
