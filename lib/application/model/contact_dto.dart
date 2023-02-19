import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';

part 'contact_dto.freezed.dart';

@freezed
class ContactDto with _$ContactDto {
  const factory ContactDto({
    @Default("") String id,
    required String name,
    required ContactMethod method,
    required String value,
  }) = _ContactDto;
}