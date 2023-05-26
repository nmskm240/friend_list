import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';

part 'contact_edit_page_state.freezed.dart';

@freezed
class ContactEditPageState with _$ContactEditPageState {
  const ContactEditPageState._();
  const factory ContactEditPageState({
    @protected required Person person,
    @protected required Contact contact,
    @protected required GlobalKey<FormBuilderState> key,
  }) = _ContactEditPageState;

  String get formFieldName => Strings.formFieldName;
  String get formFieldMethod => Strings.formFieldMethod;
  String get formFieldValue => Strings.formFieldValue;
  Map<String, dynamic> get initialValue => {
        formFieldName: contact.name,
        formFieldMethod: contact.method,
        formFieldValue: contact.value,
      };
  Key get formKey => key;

  bool validate() {
    return key.currentState!.validate() && !isDuplicatedContactMethodAndValue();
  }

  bool isDuplicatedContactMethodAndValue() {
    final values = key.currentState!.instantValue;
    if (contact.method == values[formFieldMethod] &&
        contact.value == values[formFieldValue]) {
      return true;
    }
    return person.hasSameContactByMethodAndValue(
        values[formFieldMethod], values[formFieldValue]);
  }

  Contact save() {
    key.currentState!.save();
    final values = key.currentState!.value;
    if (!values.containsKey(formFieldName) ||
        !values.containsKey(formFieldMethod) ||
        !values.containsKey(formFieldValue)) {
      // TODO: 例外クラス定義
      throw Exception("Formが正しく作れていません");
    }
    contact.name = values[formFieldName];
    contact.method = values[formFieldMethod];
    contact.value = values[formFieldValue];
    return contact;
  }

  /// validate失敗時のコールバック
  /// key経由でView側へエラー表示をする
  void onInvalid() {
    if (isDuplicatedContactMethodAndValue()) {
      for (final field in key.currentState!.fields.entries) {
        field.value.invalidate(Strings.duplicateContact);
      }
      return;
    }
    // TODO: 例外クラス定義
    throw Exception("失敗原因が不明");
  }
}
