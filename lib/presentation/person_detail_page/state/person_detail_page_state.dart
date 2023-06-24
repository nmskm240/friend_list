import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:sprintf/sprintf.dart';

part 'person_detail_page_state.freezed.dart';

@freezed
class PersonDetailPageState with _$PersonDetailPageState {
  const PersonDetailPageState._();
  const factory PersonDetailPageState({
    required Person person,
  }) = _PersonDetailPageState;

  String get name => person.name;
  String get nickname => person.nickname;
  Uint8List get icon => person.icon;
  String get formatedAge => sprintf(
      Strings.yearsOldFormat, [person.hasBirthdate ? person.age : "??"]);
  List<Anniversary> get anniversaries => person.anniversaries;
  List<Contact> get contacts => person.contacts;
}
