import 'package:friend_list/domain/person/i_person_repository.dart';

class PersonService {
  final IPersonRepository repository;

  const PersonService(this.repository);
}