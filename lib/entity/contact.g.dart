// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      method: $enumDecode(_$ContactMethodTypeEnumMap, json['method']),
      value: json['value'] as String,
      personID: json['person_id'] as int?,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'method': _$ContactMethodTypeEnumMap[instance.method]!,
      'value': instance.value,
      'person_id': instance.personID,
    };

const _$ContactMethodTypeEnumMap = {
  ContactMethodType.phone: 'phone',
  ContactMethodType.address: 'address',
  ContactMethodType.email: 'email',
  ContactMethodType.twitter: 'twitter',
  ContactMethodType.facebook: 'facebook',
  ContactMethodType.instagram: 'instagram',
};
