import 'package:age_calculator/age_calculator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';

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
    DateTime? birthday,
    List<Anniversary>? anniversaries,
    List<Contact>? contacts,
  }) = _Friend;
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  // Friend.fromMap(Map<String, dynamic> map) {
  //   id = map["id"];
  //   name = map["name"];
  //   nickname = map["nickname"];
  //   icon = map["icon"];
  //   birthday = map["birthday"];
  //   anniversaries = map["anniversaries"];
  //   contacts = map["contacts"];
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "id": id,
      "name": name,
      "nickname": nickname,
      "icon": icon,
      "birthday": birthday,
      // "anniversaries": anniversaries,
      // "contacts": contacts,
    };
  }

  int? get age {
    return birthday == null ? null : AgeCalculator.age(birthday!).years;
  }
}
