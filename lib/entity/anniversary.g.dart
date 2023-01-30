// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anniversary _$$_AnniversaryFromJson(Map<String, dynamic> json) =>
    _$_Anniversary(
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      personID: json['person_id'] as int?,
    );

Map<String, dynamic> _$$_AnniversaryToJson(_$_Anniversary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'person_id': instance.personID,
    };
