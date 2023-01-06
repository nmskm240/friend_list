// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anniversary _$$_AnniversaryFromJson(Map<String, dynamic> json) =>
    _$_Anniversary(
      id: json['id'] as int?,
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_AnniversaryToJson(_$_Anniversary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
    };
