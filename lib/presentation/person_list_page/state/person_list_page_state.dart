import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/person.dart';

part 'person_list_page_state.freezed.dart';

@freezed
class PersonListPageState with _$PersonListPageState {
  const PersonListPageState._();
  const factory PersonListPageState({
    required Iterable<Person> persons,
    @Default(false) bool isFiltering,
    required PersonSortOrder sortOrder,
    required TextEditingController searchBarController,
  }) = _PersonListPageState;

  void dispose() {
    searchBarController.dispose();
  }
}
