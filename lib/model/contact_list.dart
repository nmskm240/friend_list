import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/contact.dart';

part 'contact_list.freezed.dart';

@freezed
class ContactList with _$ContactList {
  const factory ContactList({
    @Default([]) List<Contact> values,
  }) = _ContactList;
}
