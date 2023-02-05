import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_factory.dart';
import 'package:uuid/uuid.dart';

class AnniversaryFactory implements IAnniversaryFactory {
  @override
  Anniversary create(String name, DateTime date, String personId) {
    return Anniversary(const Uuid().v1(), name, date, personId);
  }
}
