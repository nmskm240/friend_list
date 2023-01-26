import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/util/datetime_field.dart';

part 'anniversary.freezed.dart';
part 'anniversary.g.dart';

@freezed
class Anniversary with _$Anniversary {
  const factory Anniversary({
    required String name,
    @DateTimeField() required DateTime date,
    @JsonKey(name: "friend_id") int? friendID,
  }) = _Anniversary;
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);
}
