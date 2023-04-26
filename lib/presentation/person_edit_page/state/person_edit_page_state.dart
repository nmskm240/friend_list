import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/application/model/anniversary_edit_settings.dart';
import 'package:friend_list/application/model/contact_edit_settings.dart';
import 'package:friend_list/domain/person/person.dart';

part 'person_edit_page_state.freezed.dart';

@freezed
class PersonEditPageState with _$PersonEditPageState {
  const PersonEditPageState._();
  const factory PersonEditPageState({
    required Person person,
    @Default(false) bool shouldRefreshWidget,
  }) = _PersonEditPageState;

  ///birathdateが一番上になっている記念日リスト
  Iterable<AnniversaryEditSettings> get anniversaryEditSettings {
    final settings = person.anniversaries.map((e) {
      return AnniversaryEditSettings(
        name: e.name,
        date: e.date,
        canDelete: e.name != "birthdate",
        canChangeName: e.name != "birthdate",
      );
    }).toList();
    settings.sort((a, b) => _sortAnniversary(a, b));
    if (settings.isEmpty || settings.first.name != "birthdate") {
      const birthdate = AnniversaryEditSettings(
          name: "birthdate", canDelete: false, canChangeName: false);
      settings.insert(0, birthdate);
    }
    return settings;
  }

  Iterable<ContactEditSettings> get contactEditSettings => person.contacts.map(
        (e) => ContactEditSettings(
          name: e.name,
          method: e.method,
          value: e.value,
        ),
      );

  bool get hasBirthdate => person.hasSameAnniversaryByName("birthdate");

  int _sortAnniversary(AnniversaryEditSettings a, AnniversaryEditSettings b) {
    if (a.name == "birthdate") {
      return -1;
    } else if (b.name == "birthdate") {
      return 1;
    } else {
      return 0;
    }
  }
}
