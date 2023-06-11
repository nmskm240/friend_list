// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';

part 'anniversary.freezed.dart';
part 'anniversary.g.dart';

@freezed
class Anniversary with _$Anniversary {
  const Anniversary._();
  const factory Anniversary({
    @JsonKey(name: Strings.jsonKeyId) required String id,
    @JsonKey(name: Strings.jsonKeyName) required String name,
    @JsonKey(name: Strings.jsonKeyDate) required DateTime date,
    @JsonKey(name: Strings.jsonKeyPersonId) required String personId,
    @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
    @Default(<int>[])
        List<int> notificationIds,
    @CreatedAtField()
    @JsonKey(name: Strings.jsonKeyCreatedAt)
        DateTime? createdAt,
    @UpdatedAtField()
    @JsonKey(name: Strings.jsonKeyUpdatedAt)
        DateTime? updatedAt,
  }) = _Anniversary;
  factory Anniversary.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryFromJson(json);

  bool get isBirthdate => name == Strings.birthdate;
  bool get isValid {
    return id.isNotEmpty &&
        name.isNotEmpty &&
        date.isBefore(DateTime.now()) &&
        personId.isNotEmpty;
  }

  Iterable<int> addNotification(int id) {
    return [...notificationIds, id];
  }

  Iterable<int> removeNotification(int id) {
    return notificationIds.where((element) => element != id);
  }

  bool hasNotification(int id) {
    return notificationIds.contains(id);
  }
}
