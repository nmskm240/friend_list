import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part 'anniversary.g.dart';

@JsonSerializable()
class Anniversary {
  @JsonKey(name: Strings.jsonKeyId)
  late final String id;
  @JsonKey(name: Strings.jsonKeyName)
  late String name;
  @JsonKey(name: Strings.jsonKeyDate)
  late DateTime date;
  @JsonKey(name: Strings.jsonKeyPersonId)
  late final String personId;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  late final DateTime updatedAt;

  Anniversary({
    required this.id,
    required this.name,
    required this.date,
    required this.personId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);

  Map<String, dynamic> toJson() => _$AnniversaryToJson(this);

  bool get isBirthdate => name == Strings.birthdate;
  bool get isValid {
    return id.isNotEmpty &&
        name.isNotEmpty &&
        date.isBefore(DateTime.now()) &&
        personId.isNotEmpty;
  }

  bool isB(String personId) {
    return this.personId == personId;
  }
}
