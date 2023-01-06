// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      id: json['id'] as int?,
      method: $enumDecode(_$ContactMethodTypeEnumMap, json['method']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': _$ContactMethodTypeEnumMap[instance.method]!,
      'value': instance.value,
    };

const _$ContactMethodTypeEnumMap = {
  ContactMethodType.phone: 'phone',
  ContactMethodType.address: 'address',
  ContactMethodType.email: 'email',
  ContactMethodType.twitter: 'twitter',
  ContactMethodType.facebook: 'facebook',
  ContactMethodType.instagram: 'instagram',
};
