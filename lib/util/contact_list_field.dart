import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/model/contact.dart';

class ContactListField implements JsonConverter<List<Contact>?, List<Map<String, dynamic>>?> {
  const ContactListField();

  @override
  List<Contact>? fromJson(List<Map<String, dynamic>>? str) {
    if(str == null) return null;
    return str.map((e) {
      return Contact.fromJson(e);
    }).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<Contact>? contacts) {
    if (contacts == null) return null;
    return contacts.map((e) {
      return e.toJson();
    }).toList();
  }
}
