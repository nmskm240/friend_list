import 'package:friend_list/domain/person/anniversary/anniversary.dart';

abstract class IAnniversaryFactory {
  Anniversary create(String name, DateTime date, String personId);
}