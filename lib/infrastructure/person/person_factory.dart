import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:uuid/uuid.dart';

class PersonFactory implements IPersonFactory {
  @override
  Person create(String name, {String nickname = "", String icon = ""}) {
    return Person(const Uuid().v1(), name, nickname, icon, null, null);
  }
}
