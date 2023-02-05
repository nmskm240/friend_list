import 'package:friend_list/domain/anniversary/anniversary.dart';

abstract class IAnniversaryRepository {
  Future<void> deleteAll();
  Future<void> deleteAllByPersonID(String personId);
  Future<void> deleteByID(String id);
  Future<Anniversary?> findByID(String id);
  Future<Iterable<Anniversary>> findByPersonID(String personId);
  Future<Iterable<Anniversary>> getAll();
  Future<Anniversary> save(Anniversary anniversary);
}