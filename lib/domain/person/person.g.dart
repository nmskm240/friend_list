// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String? ?? "",
      icon: const Uint8ListField().fromJson(json['icon'] as String),
      anniversaries: (json['anniversaries'] as List<dynamic>?)
          ?.map((e) => Anniversary.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'icon': const Uint8ListField().toJson(instance.icon),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
