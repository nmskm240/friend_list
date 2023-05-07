import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';

part 'person_detail_page_state.freezed.dart';

@freezed
class PersonDetailPageState with _$PersonDetailPageState {
  String get id => domain.id;
  Uint8List get icon => domain.icon;
  String get name => domain.name;
  String get nickname => domain.nickname;
  int? get age {
    try {
      return domain.age;
    } catch (e) {
      if (e is UnregisteredAnniversaryException) {
        return null;
      }
      rethrow;
    }
  }

  Iterable<Anniversary> get anniversaries => domain.anniversaries;
  Iterable<Contact> get contacts => domain.contacts;

  const PersonDetailPageState._();
  const factory PersonDetailPageState({
    @protected required Person domain,
  }) = _PersonDetailPageState;
}
