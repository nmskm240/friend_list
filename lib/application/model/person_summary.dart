import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/application/navigation_service.dart';

part 'person_summary.freezed.dart';

@freezed
class PersonSummary
    with _$PersonSummary
    implements RouteRequest, RouteResponce {
  const factory PersonSummary(
    String id,
    String name,
    String nickname,
    Uint8List icon,
    int? age,
  ) = _PersonSummary;
}
