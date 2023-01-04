import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/model/contact.dart';

void main() {
  var contact =
      const Contact(method: ContactMethodType.address, value: "Test Test 0-0");
  test("Contact model conver to json test", () {
    var json = contact.toJson();
    expect(json, {'method': "address", "value": "Test Test 0-0"});
  });

  test("Contact model convert from json test", () {
    var obj = Contact.fromJson(
        {'method': "address", "value": "Test Test 0-0"});
    expect(obj.method.name, "Address");
    expect(obj.value, "Test Test 0-0");
  });
}
