import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/anniversary/i_anniversary_factory.dart';
import 'package:uuid/uuid.dart';

class AnniversaryFactory implements IAnniversaryFactory {
  @override
  Anniversary create(
    String personId, {
    String? name,
    DateTime? date,
  }) {
    return Anniversary(
      id: const Uuid().v1(),
      name: name ?? "",
      date: date ?? DateTime.now(),
      personId: personId,
    );
  }
}
