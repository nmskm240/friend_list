import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

final filteredPersons = Provider<_FilteredPersonUsecase>((ref) {
  final repository = ref.read(personRepository);
  return _FilteredPersonUsecase(repository);
});

class _FilteredPersonUsecase {
  final IPersonRepository _repository;

  const _FilteredPersonUsecase(IPersonRepository repository)
      : _repository = repository;

  Future<Iterable<Person>> call(String filter) async {
    final filtered = await _repository.findByNameOrNickname(filter);
    return filtered;
  }
}
