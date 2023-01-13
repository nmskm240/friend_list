import 'package:friend_list/entity/anniversary.dart';

abstract class AnniversaryRepository {
  Future<Anniversary> save(Anniversary element);
  Future<Anniversary> findByID(int id);
  Future<void> deleteByID(int id);
  Future<Iterable<Anniversary>> getAllByFriendID(int friendID);
}
