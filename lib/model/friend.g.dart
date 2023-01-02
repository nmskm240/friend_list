// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      iconPath: json['iconPath'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      anniversaries: (json['anniversaries'] as List<dynamic>?)
          ?.map((e) => Anniversary.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'name': instance.name,
      'nickname': instance.nickname,
      'iconPath': instance.iconPath,
      'birthday': instance.birthday?.toIso8601String(),
      'anniversaries': instance.anniversaries,
      'contacts': instance.contacts,
    };
