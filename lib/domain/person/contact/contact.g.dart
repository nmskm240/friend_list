// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as String,
      name: json['name'] as String,
      method: $enumDecode(_$ContactMethodEnumMap, json['method'],
          unknownValue: ContactMethod.unknown),
      value: json['value'] as String,
      personId: json['person_id'] as String,
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'method': _$ContactMethodEnumMap[instance.method]!,
      'value': instance.value,
      'person_id': instance.personId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ContactMethodEnumMap = {
  ContactMethod.unknown: 'unknown',
  ContactMethod.phone: 'phone',
  ContactMethod.address: 'address',
  ContactMethod.twitter: 'twitter',
  ContactMethod.facebook: 'facebook',
  ContactMethod.instagram: 'instagram',
};
