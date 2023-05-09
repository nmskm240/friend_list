import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/person/contact/contact.dart';

part 'contact_dto.freezed.dart';

@freezed
class ContactDto with _$ContactDto {
  const factory ContactDto({
    @Default("") String id,
    @Default("") String name,
    @Default(ContactMethod.phone) ContactMethod method,
    @Default("") String value,
  }) = _ContactDto;
  factory ContactDto.fromModel(Contact model) {
    return ContactDto(
      id: model.id,
      name: model.name,
      method: model.method,
      value: model.value,
    );
  }
}
