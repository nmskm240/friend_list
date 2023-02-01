import 'package:friend_list/domain/anniversary/anniversary.dart';

abstract class IAnniversaryRepository {
  Future<Anniversary?> findByID(int id);
  Future<Iterable<Anniversary>> findByPersonID(int personId);
  Future<Iterable<Anniversary>> getAll();
  Future<Anniversary> save(Anniversary anniversary);
}