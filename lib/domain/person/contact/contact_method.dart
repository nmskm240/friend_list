import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ContactMethod {
  unknown(FontAwesomeIcons.question),
  phone(FontAwesomeIcons.phone),
  address(FontAwesomeIcons.mapPin),
  twitter(FontAwesomeIcons.twitter),
  facebook(FontAwesomeIcons.facebook),
  instagram(FontAwesomeIcons.instagram),
  ;

  final IconData icon;

  const ContactMethod(this.icon);

  @override
  String toString() {
    if(this == ContactMethod.unknown) {
      return "";
    } else {
      return name;
    }
  }
}