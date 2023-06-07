// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      id: json['id'] as String,
      name: json['name'] as String,
      method: $enumDecode(_$ContactMethodEnumMap, json['method'],
          unknownValue: ContactMethod.unknown),
      value: json['value'] as String,
      personId: json['person_id'] as String,
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'method': _$ContactMethodEnumMap[instance.method]!,
      'value': instance.value,
      'person_id': instance.personId,
      'created_at': const CreatedAtField().toJson(instance.createdAt),
      'updated_at': const UpdatedAtField().toJson(instance.updatedAt),
    };

const _$ContactMethodEnumMap = {
  ContactMethod.unknown: 'unknown',
  ContactMethod.phone: 'phone',
  ContactMethod.address: 'address',
  ContactMethod.twitter: 'twitter',
  ContactMethod.facebook: 'facebook',
  ContactMethod.instagram: 'instagram',
};
