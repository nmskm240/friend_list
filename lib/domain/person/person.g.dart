// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$$_PersonFromJson(Map<String, dynamic> json) => _$_Person(
      id: json['id'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String? ?? "",
      icon: const Uint8ListField().fromJson(json['icon'] as String),
      anniversaries: (json['anniversaries'] as List<dynamic>?)
              ?.map((e) => Anniversary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Anniversary>[],
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Contact>[],
      createdAt: const CreatedAtField().fromJson(json['created_at'] as String?),
      updatedAt: const UpdatedAtField().fromJson(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'icon': const Uint8ListField().toJson(instance.icon),
      'created_at': const CreatedAtField().toJson(instance.createdAt),
      'updated_at': const UpdatedAtField().toJson(instance.updatedAt),
    };
