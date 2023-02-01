import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    int? id,
    required ContactMethod method,
    required String value,
    @JsonKey(name: "person_id") required int personId,
  }) = _Contact;
  factory Contact.fromJson(Map<String, Object> json) => _$ContactFromJson(json);
}
