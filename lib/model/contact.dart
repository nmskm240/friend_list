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
  phone("Phone", "tel"),
  address("Address", ""),
  email("Email", "mailto"),
  twitter("Twitter", "twitter:"),
  facebook("Facebook", "facebook:"),
  instagram("Instagram", "instagram:"),
  ;

  final String name;
  final String uri;

  const ContactMethodType(
    this.name,
    this.uri,
  );
}
