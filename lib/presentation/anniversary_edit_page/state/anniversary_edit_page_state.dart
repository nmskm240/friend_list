import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/anniversary/remind/remind.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/person/anniversary/remind/remind_factory.dart';

part 'anniversary_edit_page_state.freezed.dart';

@freezed
class AnniversaryEditPageState with _$AnniversaryEditPageState {
  const AnniversaryEditPageState._();
  const factory AnniversaryEditPageState({
    @protected required Person person,
    @protected required Anniversary anniversary,
    @protected required GlobalKey<FormBuilderState> key,
  }) = _AnniversaryEditPageState;

  String get formFieldName => Strings.formFieldName;
  String get formFieldDate => Strings.formFieldDate;
  String get formFieldRemind => Strings.formFieldRemind;
  bool get isEditableName => !anniversary.isBirthdate;
  Map<String, dynamic> get initialValue => {
        formFieldName: anniversary.name,
        formFieldDate: anniversary.date,
        if (anniversary.reminds.isNotEmpty)
          formFieldRemind: anniversary.reminds.map((e) => e.timing).toList(),
      };
  Key get formKey => key;

  @protected
  bool get isInvalidForm {
    final value = key.currentState!.value;
    return !value.containsKey(formFieldName) ||
        !value.containsKey(formFieldDate) ||
        !value.containsKey(formFieldRemind);
  }

  @protected
  String get formFieldNameValueOrInitial {
    final value = key.currentState!.value;
    return value.containsKey(formFieldName)
        ? value[formFieldName] as String
        : anniversary.name;
  }

  @protected
  DateTime get formFieldDateValueOrInitial {
    final value = key.currentState!.value;
    return value.containsKey(formFieldDate)
        ? value[formFieldDate] as DateTime
        : anniversary.date;
  }

  @protected
  Iterable<Remind> get formFieldRemindValueOrInitial {
    final value = key.currentState!.value;
    if(!value.containsKey(formFieldRemind) || value[formFieldRemind] == null) {
      return anniversary.reminds;
    }
    final list = value[formFieldRemind] as List<int>;
    final factory = RemindFactory(anniversary.id);
    return list.map((e) => factory.create(e));
  }

  bool isDuplicatedAnniversaryName(String name) {
    final isDiffrent = anniversary.name != name;
    return person.hasSameAnniversaryByName(name) && isDiffrent;
  }

  /// 名前が入力されていない、birthdateなど予約語が入力されている、重複した名前など場合はvalidateを通さない
  String? validateAnniversayName(String? name) {
    //TODO: 返り値をconstにする
    if (name == null || name.isEmpty) return "必須パラメータ";
    if (name == Strings.birthdate) return "使用できない名前";
    if (isDuplicatedAnniversaryName(name)) return Strings.duplicateAnniversary;
    return null;
  }

  bool validate() {
    return key.currentState!.validate();
  }

  Anniversary save() {
    key.currentState!.save();
    final value = key.currentState!.value;
    if (isInvalidForm) {
      // TODO: 例外クラス定義
      throw Exception("Formが正しく作られていません");
    }
    return anniversary.copyWith(
      name: formFieldNameValueOrInitial,
      date: formFieldDateValueOrInitial,
      reminds: formFieldRemindValueOrInitial.toList(),
    );
  }
}
