import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';

part 'contact_edit_page_provider_parameter.freezed.dart';

@freezed
class ContactEditPageProviderParameter with _$ContactEditPageProviderParameter {
  const factory ContactEditPageProviderParameter({
    required Person person,
    required Contact contact,
  }) = _ContactEditPageProviderParameter;
}
