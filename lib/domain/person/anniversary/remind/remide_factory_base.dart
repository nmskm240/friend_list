import 'package:friend_list/domain/person/anniversary/remind/remind.dart';

abstract class RemindFactoryBase {
  final String anniversaryId;

  RemindFactoryBase(this.anniversaryId);

  Remind create(int timing) {
    return Remind(anniversaryId: anniversaryId, timing: timing);
  }
}
