import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';

part 'remind.freezed.dart';
part 'remind.g.dart';

@freezed
class Remind with _$Remind {
  const factory Remind({
    @JsonKey(name: Strings.jsonKeyAnniversaryId) required String anniversaryId,
    @JsonKey(name: Strings.jsonKeyRemindTiming) required int timing,
  }) = _Remind;

  factory Remind.fromJson(Map<String, dynamic> json) => _$RemindFromJson(json);
}
