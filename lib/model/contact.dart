import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  phone("Phone", FontAwesomeIcons.phone, r"^0[-\d]{9,12}", "tel"),
  address("Address", FontAwesomeIcons.mapLocation, r"", ""),
  email("Email", Icons.mail, r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+", "mailto"),
  twitter("Twitter", FontAwesomeIcons.twitter, r"^[a-zA-Z0-9.a-zA-Z0-9_]", "twitter:"),
  facebook("Facebook", FontAwesomeIcons.facebook, r"^[a-zA-Z0-9.a-zA-Z0-9_]", "facebook:"),
  instagram("Instagram", FontAwesomeIcons.instagram, r"^[a-zA-Z0-9.a-zA-Z0-9_]", "instagram:"),
  ;

  final String name;
  final IconData icon;
  final String rule;
  final String uri;

  const ContactMethodType(
    this.name,
    this.icon,
    this.rule,
    this.uri,
  );
}
