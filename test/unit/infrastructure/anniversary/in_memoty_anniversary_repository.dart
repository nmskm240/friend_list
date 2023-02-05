import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_repository.dart';

class InMemoryAnniversaryRepository implements IAnniversaryRepository {
  final List<Anniversary> anniversaries;

  const InMemoryAnniversaryRepository(this.anniversaries);

  @override 
  Future<void> deleteAll() async {
    anniversaries.clear();
  }

  @override
  Future<void> deleteAllByPersonID(String personId) async {
    anniversaries.removeWhere((element) => element.personId == personId);
  }

  @override
  Future<void> deleteByID(String id) async {
    anniversaries.removeWhere((element) => element.id == id);
  }

  @override
  Future<Anniversary?> findByID(String id) async {
    final searched = anniversaries.where((element) => element.id == id);
    return searched.isEmpty ? null : searched.first;
  }

  @override
  Future<Iterable<Anniversary>> findByPersonID(String personId) async {
    return anniversaries.where((element) => element.personId == personId);
  }

  @override
  Future<Iterable<Anniversary>> getAll() async {
    return anniversaries;
  }

  @override
  Future<Anniversary> save(Anniversary anniversary) async {
    if (anniversaries
        .where((element) => element.id == anniversary.id)
        .isEmpty) {
      anniversaries.add(anniversary);
      return anniversary;
    } else {
      final index =
          anniversaries.indexWhere((element) => element.id == anniversary.id);
      anniversaries.removeAt(index);
      anniversaries.insert(index, anniversary);
      return anniversary;
    }
  }
}
