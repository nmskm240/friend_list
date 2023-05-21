import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';

final personList = FutureProvider((ref) {
  final repository = ref.watch(personRepository);
  return repository.getAll();
});
