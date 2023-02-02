import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_factory.dart';

class AutoIncrementAnniversaryFactory implements IAnniversaryFactory {
  int count = 0;

  @override
  Anniversary create(String name, DateTime date, String personId) {
    count++;
    return Anniversary(count.toString(), name, date, personId);
  }

}