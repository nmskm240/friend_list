import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ContactMethod {
  phone(FontAwesomeIcons.phone),
  address(FontAwesomeIcons.mapPin),
  twitter(FontAwesomeIcons.twitter),
  facebook(FontAwesomeIcons.facebook),
  instagram(FontAwesomeIcons.instagram),
  ;

  final IconData icon;

  const ContactMethod(this.icon);
}
