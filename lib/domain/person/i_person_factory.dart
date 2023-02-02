import 'package:friend_list/domain/person/person.dart';

abstract class IPersonFactory {
  Person create(String name, {String nickname = "", String icon = ""});
}
