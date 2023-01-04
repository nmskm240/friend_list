import 'package:age_calculator/age_calculator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';
import 'package:friend_list/util/anniversary_list_field.dart';
import 'package:friend_list/util/contact_list_field.dart';
import 'package:friend_list/util/datetime_field.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
class Friend with _$Friend {
  const Friend._();
  const factory Friend({
    int? id,
    required String name,
    String? nickname,
    String? icon,
    @DateTimeField() DateTime? birthday,
    @AnniversaryListField() List<Anniversary>? anniversaries,
    @ContactListField() List<Contact>? contacts,
  }) = _Friend;
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  int? get age {
    return birthday == null ? null : AgeCalculator.age(birthday!).years;
  }
}