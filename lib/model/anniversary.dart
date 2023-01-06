import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/util/datetime_field.dart';

part 'anniversary.freezed.dart';
part 'anniversary.g.dart';

@freezed
class Anniversary with _$Anniversary {
  const factory Anniversary({
    int? id,
    required String name,
    @DateTimeField() required DateTime date,
  }) = _Anniversary;
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);
}
