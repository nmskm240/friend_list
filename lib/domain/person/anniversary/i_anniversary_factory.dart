import 'package:friend_list/domain/person/anniversary/anniversary.dart';

abstract class IAnniversaryFactory {
  Anniversary create(String personId, {String name = "", DateTime? date});
}