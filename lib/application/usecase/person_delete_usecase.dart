import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';

final personDeleter = Provider<_PerrsonDeleteUsecase>((ref) {
  final repository = ref.read(personRepository);
  return _PerrsonDeleteUsecase(repository);
});

class _PerrsonDeleteUsecase {
  final IPersonRepository _repository;

  const _PerrsonDeleteUsecase(IPersonRepository repository)
      : _repository = repository;

  Future<void> call(String id) async {
    await _repository.deleteByID(id);
  }
}
