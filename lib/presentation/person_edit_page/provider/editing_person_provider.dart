import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/common/provider/default_icon_provider.dart';
import 'package:friend_list/presentation/common/provider/person_service_provider.dart';

final editingPersonProvider =
    FutureProvider.family.autoDispose<Person, String?>((ref, id) async {
  final service = ref.read(personServiceProvider);
  final defaultIcon = await ref.watch(defaultIconProvider.future);
  final person = service.createEmptyPerson(defaultIcon);
  return person;
});
