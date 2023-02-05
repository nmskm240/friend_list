// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      json['contact_id'] as String,
      json['name'] as String,
      $enumDecode(_$ContactMethodEnumMap, json['method']),
      json['value'] as String,
      json['person_id'] as String,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'contact_id': instance.id,
      'name': instance.name,
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
