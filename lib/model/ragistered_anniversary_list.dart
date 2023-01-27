import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';

part 'ragistered_anniversary_list.freezed.dart';

@freezed
class RegisteredAnniversaryList with _$RegisteredAnniversaryList {
  const factory RegisteredAnniversaryList({
    Anniversary? birthday,
    @Default([]) List<Anniversary> customs,
  }) = _RegisteredAnniversaryList;
}