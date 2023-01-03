import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required ContactMethodType method,
    required String value,
  }) = _Contact;
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

enum ContactMethodType {
  phone("Phone", r"^0[-\d]{9,12}", "tel"),
  address("Address", r"", ""),
  email("Email", r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+", "mailto"),
  twitter("Twitter", r"^[a-zA-Z0-9.a-zA-Z0-9_]", "twitter:"),
  facebook("Facebook", r"^[a-zA-Z0-9.a-zA-Z0-9_]", "facebook:"),
  instagram("Instagram", r"^[a-zA-Z0-9.a-zA-Z0-9_]", "instagram:"),
  ;

  final String name;
  final String rule;
  final String uri;

  const ContactMethodType(
    this.name,
    this.rule,
    this.uri,
  );
}
