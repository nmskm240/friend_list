import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/util/annotation/created_at_field.dart';
import 'package:friend_list/util/annotation/updated_at_field.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const Person._();
  const factory Person({
    int? id,
    required String name,
    @Default("") String nickname,
    @Default("") String icon,
    @Default([]) @JsonKey(ignore: true) List<Anniversary> anniversaries,
    @Default([]) @JsonKey(ignore: true) List<Contact> contacts,
    @CreatedAtField() @JsonKey(name: "created_at") DateTime? createdAt,
    @UpdatedAtField() @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Person;
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
