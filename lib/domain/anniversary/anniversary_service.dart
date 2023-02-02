import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_factory.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_repository.dart';

class AnniversaryService {
  final IAnniversaryFactory factroy;
  final IAnniversaryRepository repository;

  const AnniversaryService(this.factroy, this.repository);

  Future<bool> isDuplicated(Anniversary anniversary) async {
    final searched = await repository.findByPersonID(anniversary.personId);
    return searched.any((element) => element.name == anniversary.name);
  }
}
