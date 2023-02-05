import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/annotation/created_at_field.dart';
import 'package:friend_list/common/annotation/updated_at_field.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person(
    @JsonKey(name: "person_id") String id,
    String name,
    String nickname,
    String icon,
    @CreatedAtField() @JsonKey(name: "created_at") DateTime? createdAt,
    @UpdatedAtField() @JsonKey(name: "updated_at") DateTime? updatedAt,
  ) = _Person;
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
