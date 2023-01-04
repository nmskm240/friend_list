import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';
import 'package:friend_list/model/friend.dart';

void main() {
  var friend = Friend(
    name: "test",
    nickname: "test",
    birthday: DateTime(2000, 1, 1),
    icon: "image_bytes",
    anniversaries: [
      Anniversary(name: "first meeting", date: DateTime(2010, 1, 31))
    ],
    contacts: [
      const Contact(method: ContactMethodType.email, value: "abc@efg.hi"),
    ],
  );

  test("Friend model conver to json test", () {
    var json = friend.toJson();
    expect(json, {
      'id': null,
      'name': 'test',
      'nickname': 'test',
      'icon': 'image_bytes',
      'birthday': DateTime(2000, 1, 1).toUtc().toIso8601String(),
      'anniversaries': [
        {
          "name": "first meeting",
          "date": DateTime(2010, 1, 31).toIso8601String()
        }
      ],
      'contacts': [
        {"method": "email", "value": "abc@efg.hi"}
      ]
    });
  });

  test("Friend model convert from json test", () {
    var json = {
      'id': null,
      'name': 'test',
      'nickname': 'test',
      'icon': 'image_bytes',
      'birthday': DateTime(2000, 1, 1).toUtc().toIso8601String(),
      'anniversaries': [
        {
          "name": "first meeting",
          "date": DateTime(2010, 1, 31).toIso8601String()
        }
      ],
      'contacts': [
        {"method": "email", "value": "abc@efg.hi"}
      ]
    };
    var obj = Friend.fromJson(json);
    expect(obj.icon, "image_bytes");
  });
}
