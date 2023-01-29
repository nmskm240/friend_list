// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      id: json['id'] as int?,
      name: json['name'] as String,
      nickname: json['nickname'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'icon': instance.icon,
      'created_at': const CreatedAtField().toJson(instance.createdAt),
      'updated_at': const UpdatedAtField().toJson(instance.updatedAt),
    };
