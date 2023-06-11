// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Anniversary _$AnniversaryFromJson(Map<String, dynamic> json) {
  return _Anniversary.fromJson(json);
}

/// @nodoc
mixin _$Anniversary {
  @JsonKey(name: Strings.jsonKeyId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyName)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyDate)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyPersonId)
  String get personId => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
  List<int> get notificationIds => throw _privateConstructorUsedError;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnniversaryCopyWith<Anniversary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryCopyWith<$Res> {
  factory $AnniversaryCopyWith(
          Anniversary value, $Res Function(Anniversary) then) =
      _$AnniversaryCopyWithImpl<$Res, Anniversary>;
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyDate)
          DateTime date,
      @JsonKey(name: Strings.jsonKeyPersonId)
          String personId,
      @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
          List<int> notificationIds,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class _$AnniversaryCopyWithImpl<$Res, $Val extends Anniversary>
    implements $AnniversaryCopyWith<$Res> {
  _$AnniversaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? personId = null,
    Object? notificationIds = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationIds: null == notificationIds
          ? _value.notificationIds
          : notificationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnniversaryCopyWith<$Res>
    implements $AnniversaryCopyWith<$Res> {
  factory _$$_AnniversaryCopyWith(
          _$_Anniversary value, $Res Function(_$_Anniversary) then) =
      __$$_AnniversaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyDate)
          DateTime date,
      @JsonKey(name: Strings.jsonKeyPersonId)
          String personId,
      @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
          List<int> notificationIds,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class __$$_AnniversaryCopyWithImpl<$Res>
    extends _$AnniversaryCopyWithImpl<$Res, _$_Anniversary>
    implements _$$_AnniversaryCopyWith<$Res> {
  __$$_AnniversaryCopyWithImpl(
      _$_Anniversary _value, $Res Function(_$_Anniversary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? personId = null,
    Object? notificationIds = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Anniversary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationIds: null == notificationIds
          ? _value._notificationIds
          : notificationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Anniversary extends _Anniversary {
  const _$_Anniversary(
      {@JsonKey(name: Strings.jsonKeyId)
          required this.id,
      @JsonKey(name: Strings.jsonKeyName)
          required this.name,
      @JsonKey(name: Strings.jsonKeyDate)
          required this.date,
      @JsonKey(name: Strings.jsonKeyPersonId)
          required this.personId,
      @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
          final List<int> notificationIds = const <int>[],
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          this.createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          this.updatedAt})
      : _notificationIds = notificationIds,
        super._();

  factory _$_Anniversary.fromJson(Map<String, dynamic> json) =>
      _$$_AnniversaryFromJson(json);

  @override
  @JsonKey(name: Strings.jsonKeyId)
  final String id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  final String name;
  @override
  @JsonKey(name: Strings.jsonKeyDate)
  final DateTime date;
  @override
  @JsonKey(name: Strings.jsonKeyPersonId)
  final String personId;
  final List<int> _notificationIds;
  @override
  @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
  List<int> get notificationIds {
    if (_notificationIds is EqualUnmodifiableListView) return _notificationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationIds);
  }

  @override
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  final DateTime? createdAt;
  @override
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Anniversary(id: $id, name: $name, date: $date, personId: $personId, notificationIds: $notificationIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Anniversary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            const DeepCollectionEquality()
                .equals(other._notificationIds, _notificationIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      date,
      personId,
      const DeepCollectionEquality().hash(_notificationIds),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryCopyWith<_$_Anniversary> get copyWith =>
      __$$_AnniversaryCopyWithImpl<_$_Anniversary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnniversaryToJson(
      this,
    );
  }
}

abstract class _Anniversary extends Anniversary {
  const factory _Anniversary(
      {@JsonKey(name: Strings.jsonKeyId)
          required final String id,
      @JsonKey(name: Strings.jsonKeyName)
          required final String name,
      @JsonKey(name: Strings.jsonKeyDate)
          required final DateTime date,
      @JsonKey(name: Strings.jsonKeyPersonId)
          required final String personId,
      @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
          final List<int> notificationIds,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          final DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          final DateTime? updatedAt}) = _$_Anniversary;
  const _Anniversary._() : super._();

  factory _Anniversary.fromJson(Map<String, dynamic> json) =
      _$_Anniversary.fromJson;

  @override
  @JsonKey(name: Strings.jsonKeyId)
  String get id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  String get name;
  @override
  @JsonKey(name: Strings.jsonKeyDate)
  DateTime get date;
  @override
  @JsonKey(name: Strings.jsonKeyPersonId)
  String get personId;
  @override
  @JsonKey(name: Strings.jsonKeyNotificationId, includeToJson: false)
  List<int> get notificationIds;
  @override
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  DateTime? get createdAt;
  @override
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryCopyWith<_$_Anniversary> get copyWith =>
      throw _privateConstructorUsedError;
}
