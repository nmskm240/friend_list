import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_summary.freezed.dart';

@freezed
class PersonSummary with _$PersonSummary {
  const factory PersonSummary(
    String id,
    String name,
    String nickname,
    Uint8List icon,
  ) = _PersonSummary;
}
