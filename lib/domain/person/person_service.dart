import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';

class PersonService {
  final IPersonFactory factory;
  final IPersonRepository repository;

  const PersonService(this.factory, this.repository);
}