import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_basic_info.freezed.dart';

@freezed
class FriendBasicInfo with _$FriendBasicInfo {
  const factory FriendBasicInfo({
    @Default("") String name,
    @Default("") String nickname,
    @Default("") String icon,
  }) = _FriendBasicInfo;
}
