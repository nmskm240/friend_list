import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/person_filter_provider.dart';
import 'package:friend_list/application/person_list_provider.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

/// filter内容を適用したperson一覧、filterがない場合は全部取ってくる
final filteredPersons = FutureProvider.autoDispose<Iterable<Person>>((ref) async {
  final repository = ref.read(personRepository);
  final filter = ref.watch(personFileter);
  if (filter.isEmpty) {
    return await ref.read(personList.future);
  }
  return await repository.findByNameOrNickname(filter);
});
