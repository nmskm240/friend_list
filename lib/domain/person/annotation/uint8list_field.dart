import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class Uint8ListField implements JsonConverter<Uint8List, String> {
  const Uint8ListField();

  @override
  Uint8List fromJson(String str) {
    return base64.decode(str);
  }

  @override
  String toJson(Uint8List bytes) {
    return base64.encode(bytes);
  }
}
