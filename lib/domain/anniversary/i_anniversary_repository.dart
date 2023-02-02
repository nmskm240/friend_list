import 'package:friend_list/domain/anniversary/anniversary.dart';

abstract class IAnniversaryRepository {
  Future<void> deleteAllByPersonID(int personId);
  Future<void> deleteByID(int id);
  Future<Anniversary?> findByID(int id);
  Future<Iterable<Anniversary>> findByPersonID(int personId);
  Future<Iterable<Anniversary>> getAll();
  Future<Anniversary> save(Anniversary anniversary);
}