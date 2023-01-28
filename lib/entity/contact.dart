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
    @JsonKey(name: "friend_id") int? friendID,
  }) = _Contact;
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

enum ContactMethodType {
  phone("Phone", FontAwesomeIcons.phone, "tel"),
  address("Address", FontAwesomeIcons.mapLocation, ""),
  email("Email", Icons.mail, "mailto"),
  twitter("Twitter", FontAwesomeIcons.twitter, "twitter:"),
  facebook("Facebook", FontAwesomeIcons.facebook, "facebook:"),
  instagram("Instagram", FontAwesomeIcons.instagram, "instagram:"),
  ;

  final String name;
  final IconData icon;
  final String uri;

  const ContactMethodType(
    this.name,
    this.icon,
    this.uri,
  );
}
