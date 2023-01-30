import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';

part 'anniversary_list.freezed.dart';

@freezed
class AnniversaryList with _$AnniversaryList {
  const AnniversaryList._();
  const factory AnniversaryList({
    DateTime? birthdate,
    @Default([]) List<Anniversary> others,
  }) = _AnniversaryList;

  Iterable<Anniversary> get values => [
        if (birthdate != null) Anniversary(name: "birthdate", date: birthdate!),
        ...others,
      ];
}
