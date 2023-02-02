import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact(
    String id,
    String name,
    ContactMethod method,
    String value,
    @JsonKey(name: "person_id") String personId,
  ) = _Contact;
  factory Contact.fromJson(Map<String, Object> json) => _$ContactFromJson(json);
}
