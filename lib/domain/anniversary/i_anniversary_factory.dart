import 'package:friend_list/domain/anniversary/anniversary.dart';

abstract class IAnniversaryFactory {
  Anniversary create(String name, DateTime date, int personId);
}