import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/anniversary/i_anniversary_factory.dart';
import 'package:uuid/uuid.dart';

class AnniversaryFactory implements IAnniversaryFactory {
  @override
  Anniversary create(String name, DateTime date, String personId) {
    return Anniversary(
      id: const Uuid().v1(),
      name: name,
      date: date,
      personId: personId,
    );
  }
}
