import 'package:friend_list/application/model/person_summary.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

class PersonAppService {
  final IPersonFactory _factory;
  final IPersonRepository _repository;

  const PersonAppService(this._factory, this._repository);

  Future<Iterable<PersonSummary>> getAll() async {
    final persons = await _repository.getAll();
    return Future.wait(
      persons.map((e) async {
        final image = await e.iconImage();
        return PersonSummary(e.id, e.name, e.nickname, image);
      }),
    );
  }
}
