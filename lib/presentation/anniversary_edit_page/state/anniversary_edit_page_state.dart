import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';

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
  bool get isEditableName => !anniversary.isBirthdate;
  Map<String, dynamic> get initialValue => {
        formFieldName: anniversary.name,
        formFieldDate: anniversary.date,
      };
  Key get formKey => key;

  bool isDuplicatedAnniversaryName(String name) {
    final isDiffrent = anniversary.name != name;
    return person.hasSameAnniversaryByName(name) && isDiffrent;
  }

  bool isResercedWord(String name) {
    return !anniversary.isBirthdate && name == Strings.birthdate;
  }

  bool validate() {
    final value = key.currentState!.instantValue;
    return key.currentState!.validate() &&
        !isDuplicatedAnniversaryName(value[formFieldName]) &&
        !isResercedWord(value[formFieldName]);
  }

  Anniversary save() {
    key.currentState!.save();
    final value = key.currentState!.value;
    if (!value.containsKey(formFieldName) ||
        !value.containsKey(formFieldDate)) {
      // TODO: 例外クラス定義
      throw Exception("Formが正しく作られていません");
    }
    return anniversary.copyWith(
        name: value[formFieldName], date: value[formFieldDate]);
  }

  void onInvalid() {
    final value = key.currentState!.instantValue;
    if(isDuplicatedAnniversaryName(value[formFieldName])) {
      key.currentState!.fields[formFieldName]!.invalidate("名前の重複");
    } else if(isResercedWord(value[formFieldName])) {
      key.currentState!.fields[formFieldName]!.invalidate("使用できない名前");
    }
  }
}
