import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part 'anniversary.g.dart';

@JsonSerializable()
class Anniversary {
  @JsonKey(name: "id")
  late final String id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "date")
  late DateTime date;
  @JsonKey(name: "person_id")
  late final String personId;
  @CreatedAtField()
  @JsonKey(name: "created_at")
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: "updated_at")
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

  bool get isBirthdate => name == "birthdate";
}
