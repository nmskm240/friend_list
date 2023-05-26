import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';

part 'anniversary_edit_page_provider_parameter.freezed.dart';

@freezed
class AnniversaryEditPageProviderParameter with _$AnniversaryEditPageProviderParameter {
  const factory AnniversaryEditPageProviderParameter({
    required Person person,
    required Anniversary anniversary,
  }) = _AnniversaryEditPageProviderParameter;
}