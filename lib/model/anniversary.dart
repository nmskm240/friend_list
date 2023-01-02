import 'package:freezed_annotation/freezed_annotation.dart';

part 'anniversary.freezed.dart';
part 'anniversary.g.dart';

@freezed
class Anniversary with _$Anniversary {
  const factory Anniversary({
    required String name,
    required DateTime date,
  }) = _Anniversary;
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);
}
