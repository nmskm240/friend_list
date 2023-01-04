import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:intl/intl.dart';

void main() {
  var anniversary = Anniversary(name: "test", date: DateTime(2000, 1, 1));

  test("Anniversary model test", () {
    expect(anniversary.name, "test");
    expect(DateFormat("yyyy/M/d").format(anniversary.date), "2000/1/1");
  });

  test("Anniversary model conver to json test", () {
    var json = anniversary.toJson();
    expect(json, {'name': "test", "date": anniversary.date.toIso8601String()});
  });

  test("Anniversary model convert from json test", () {
    var obj = Anniversary.fromJson(
        {'name': "test", "date": "2000-01-01T00:00:00.000"});
    expect(obj.name, "test");
    expect(DateFormat("yyyy/M/d").format(obj.date), "2000/1/1");
  });
}
