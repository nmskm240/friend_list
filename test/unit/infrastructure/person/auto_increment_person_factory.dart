import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/person.dart';

class AutoIncrementPersonFactory implements IPersonFactory {
  int count = 0;

  @override
  Person create(String name, {String nickname = "", String icon = ""}) {
    count++;
    return Person(count.toString(), name, nickname, icon, null, null);
  }
}
