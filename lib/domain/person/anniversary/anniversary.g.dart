// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anniversary _$AnniversaryFromJson(Map<String, dynamic> json) => Anniversary(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      personId: json['person_id'] as String,
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$AnniversaryToJson(Anniversary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'person_id': instance.personId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
