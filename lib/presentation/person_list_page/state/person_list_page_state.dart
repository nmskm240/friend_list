import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/person.dart';

part 'person_list_page_state.freezed.dart';

@freezed
class PersonListPageState with _$PersonListPageState {
  const PersonListPageState._();
  const factory PersonListPageState({
    required Iterable<Person> persons,
    @Default(false) bool isFiltering,
    required TextEditingController searchBarController,
  }) = _PersonListPageState;

  void dispose() {
    searchBarController.dispose();
  }
}
