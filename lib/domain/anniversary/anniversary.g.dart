// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anniversary _$$_AnniversaryFromJson(Map<String, dynamic> json) =>
    _$_Anniversary(
      json['anniversary_id'] as String,
      json['name'] as String,
      DateTime.parse(json['date'] as String),
      json['person_id'] as String,
    );

Map<String, dynamic> _$$_AnniversaryToJson(_$_Anniversary instance) =>
    <String, dynamic>{
      'anniversary_id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'person_id': instance.personId,
    };
