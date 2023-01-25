import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';

part 'edit_data.freezed.dart';

@freezed
class EditData with _$EditData {
  const factory EditData({
    int? id,
    @Default("") String name,
    @Default("") String nickname,
    @Default("") String icon,
    DateTime? birthday,
    @Default([]) List<Anniversary> anniversaries,
    @Default([]) List<Contact> contacts,
  }) = _EditData;
}
