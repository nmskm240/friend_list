import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_and_icon.freezed.dart';

@freezed
class NameAndIcon with _$NameAndIcon {
  const factory NameAndIcon({
    @Default("") String name,
    @Default("") String nickname,
    @Default("") String icon,
  }) = _NameAndIcon;
}
