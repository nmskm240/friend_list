// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anniversary _$$_AnniversaryFromJson(Map<String, dynamic> json) =>
    _$_Anniversary(
      id: json['id'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      personId: json['person_id'] as String,
      reminds: (json['reminds'] as List<dynamic>?)
              ?.map((e) => Remind.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Remind>[],
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$_AnniversaryToJson(_$_Anniversary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'person_id': instance.personId,
      'created_at': const CreatedAtField().toJson(instance.createdAt),
      'updated_at': const UpdatedAtField().toJson(instance.updatedAt),
    };
