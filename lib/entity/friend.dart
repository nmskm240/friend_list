import 'package:age_calculator/age_calculator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/util/created_at_field.dart';
import 'package:friend_list/util/datetime_field.dart';
import 'package:friend_list/util/updated_at_field.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
class Friend with _$Friend {
  const Friend._();
  const factory Friend({
    int? id,
    required String name,
    @Default("") String nickname,
    @Default("") String icon,
    @DateTimeField() DateTime? birthday,
    @CreatedAtField() @JsonKey(name: "created_at") DateTime? createdAt,
    @UpdatedAtField() @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Friend;
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  int? get age {
    return birthday == null ? null : AgeCalculator.age(birthday!).years;
  }
}
