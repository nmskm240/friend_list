import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/application/model/person_summary.dart';
import 'package:friend_list/common/exception/unregistered_birthdate_exception.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';

class PersonAppService {
  final IPersonFactory _factory;
  final IPersonRepository _repository;

  const PersonAppService(this._factory, this._repository);

  Future<String> createPerson(
    String name,
    String nickname,
    String icon,
    List<AnniversaryDto> anniversaries,
    List<ContactDto> contacts,
  ) async {
    final person = _factory.create(name, nickname: nickname, icon: icon);
    for (final anniversary in anniversaries) {
      person.addAnniversary(anniversary.name, anniversary.date);
    }
    for (final contact in contacts) {
      person.addContact(contact.name, contact.method, contact.value);
    }
    final saved = await _repository.save(person);
    return saved.id;
  }

  Future<Iterable<PersonSummary>> getAll() async {
    final persons = await _repository.getAll();
    return Future.wait(
      persons.map((e) async {
        final image = await e.iconImage();
        late int? age;
        try {
          age = e.age;
        } catch (e) {
          if (e is UnregisteredBirthdateException) {
            age = null;
          }
        }
        return PersonSummary(e.id, e.name, e.nickname, image, age);
      }),
    );
  }
}
