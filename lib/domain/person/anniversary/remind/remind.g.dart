// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Remind _$$_RemindFromJson(Map<String, dynamic> json) => _$_Remind(
      id: json['id'] as int,
      anniversaryId: json['anniversary_id'] as String,
      intervalDays: json['interval_days'] as int,
    );

Map<String, dynamic> _$$_RemindToJson(_$_Remind instance) => <String, dynamic>{
      'id': instance.id,
      'anniversary_id': instance.anniversaryId,
      'interval_days': instance.intervalDays,
    };
