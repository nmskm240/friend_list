import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/model/anniversary.dart';

class AnniversaryListField implements JsonConverter<List<Anniversary>?, List<Map<String, dynamic>>?> {
  const AnniversaryListField();

  @override
  List<Anniversary>? fromJson(List<Map<String, dynamic>>? str) {
    if(str == null) return null;
    return str.map((e) {
      return Anniversary.fromJson(e);
    }).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<Anniversary>? anniversaries) {
    if (anniversaries == null) return null;
    return anniversaries.map((e) {
      return e.toJson();
    }).toList();
  }
}
