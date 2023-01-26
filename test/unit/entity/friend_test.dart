import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/entity/friend.dart';

void main() {
  var friend = const Friend(
    name: "test",
    nickname: "test",
    icon: "image_bytes",
  );

  test("Conversion and restoration to json", () {
    var json = friend.toJson();
    expect(json, isMap);
    expect(json["birthday"], isA<String>());
    expect(json["created_at"], isNotEmpty);
    expect(json["created_at"], isA<String>());
    expect(json["updated_at"], isNotEmpty);
    expect(json["updated_at"], isA<String>());
    var restored = Friend.fromJson(json);
    expect(restored, isA<Friend>());
    expect(restored.createdAt, isA<DateTime>());
    expect(restored.updatedAt, isA<DateTime>());
  });
}
