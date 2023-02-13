import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/anniversary/annotation/datetime_field.dart';

part 'anniversary.freezed.dart';
part 'anniversary.g.dart';

@freezed
class Anniversary with _$Anniversary {
  const factory Anniversary(
    @JsonKey(name: "anniversary_id") String id,
    String name,
    @DateTimeField() DateTime date,
    @JsonKey(name: "person_id") String personId,
  ) = _Anniversary;
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);
}
