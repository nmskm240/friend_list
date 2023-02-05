import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact(
    @JsonKey(name: "contact_id") String id,
    String name,
    ContactMethod method,
    String value,
    @JsonKey(name: "person_id") String personId,
  ) = _Contact;
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}
