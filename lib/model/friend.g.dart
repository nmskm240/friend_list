// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      id: json['id'] as int?,
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      icon: json['icon'] as String?,
      birthday: const DateTimeField().fromJson(json['birthday'] as String?),
      anniversaries: const AnniversaryListField()
          .fromJson(json['anniversaries'] as List<Map<String, dynamic>>?),
      contacts: const ContactListField()
          .fromJson(json['contacts'] as List<Map<String, dynamic>>?),
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'icon': instance.icon,
      'birthday': const DateTimeField().toJson(instance.birthday),
      'anniversaries':
          const AnniversaryListField().toJson(instance.anniversaries),
      'contacts': const ContactListField().toJson(instance.contacts),
    };
