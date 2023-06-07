import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';

part 'person_edit_page_state.freezed.dart';

@freezed
class PersonEditPageState with _$PersonEditPageState {
  const PersonEditPageState._();
  const factory PersonEditPageState({
    required Person person,
    @Default(false) bool shouldRefreshWidget,
    @protected required GlobalKey<FormBuilderState> key,
  }) = _PersonEditPageState;

  Key get formKey => key;

  String get name => person.name;
  String get nickname => person.nickname;
  Uint8List get icon => person.icon;
  Iterable<Contact> get contacts => person.contacts;

  ///birthdateが一番上になっている記念日リスト
  ///birthdateが未登録の場合先頭に[null]を配置
  Iterable<Anniversary?> get anniversaries {
    debugPrint(person.anniversaries.toString());
    final copied = List<Anniversary?>.generate(
      person.anniversaries.length,
      (i) {
        final original = person.anniversaries.elementAt(i);
        return Anniversary(
          id: original.id,
          name: original.name,
          date: original.date,
          personId: original.personId,
        );
      },
    );
    copied.sort((a, b) => _sortAnniversary(a!, b!));
    if(copied.isEmpty || !copied.first!.isBirthdate) {
      copied.insert(0, null);
    }
    return copied;
  }

  bool get hasBirthdate => person.hasSameAnniversaryByName(Strings.birthdate);

  int _sortAnniversary(Anniversary a, Anniversary b) {
    if (a.isBirthdate) {
      return -1;
    } else if (b.isBirthdate) {
      return 1;
    } else {
      return 0;
    }
  }

  bool validate() {
    return key.currentState!.validate();
  }
}
