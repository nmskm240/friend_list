// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      id: json['id'] as int?,
      method: $enumDecode(_$ContactMethodEnumMap, json['method']),
      value: json['value'] as String,
      personId: json['person_id'] as int,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': _$ContactMethodEnumMap[instance.method]!,
      'value': instance.value,
      'person_id': instance.personId,
    };

const _$ContactMethodEnumMap = {
  ContactMethod.phone: 'phone',
  ContactMethod.address: 'address',
  ContactMethod.twitter: 'twitter',
  ContactMethod.facebook: 'facebook',
  ContactMethod.instagram: 'instagram',
};
