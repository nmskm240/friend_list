import 'package:flutter/services.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:uuid/uuid.dart';

class PersonFactory implements IPersonFactory {
  @override
  Person create({String name = "", String nickname = "", Uint8List? icon}) {
    return Person(
      id: const Uuid().v1(),
      name: name,
      nickname: nickname,
      icon: icon ?? SharedPreferencesHelper.getDefaultIcon(),
    );
  }
}
