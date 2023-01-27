import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/contact.dart';

part 'registered_contact_list.freezed.dart';

@freezed
class RegisteredContactList with _$RegisteredContactList {
  const factory RegisteredContactList({
    @Default([]) List<Contact> contacts,
  }) = _RegisteredContactList;
}
