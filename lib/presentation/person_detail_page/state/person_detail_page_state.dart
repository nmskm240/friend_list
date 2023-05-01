import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
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

  Iterable<AnniversaryDto> get anniversaries =>
      domain.anniversaries.map((e) => AnniversaryDto.fromModel(e));
  Iterable<ContactDto> get contacts =>
      domain.contacts.map((e) => ContactDto.fromModel(e));

  const PersonDetailPageState._();
  const factory PersonDetailPageState({
    @protected required Person domain,
  }) = _PersonDetailPageState;
}
