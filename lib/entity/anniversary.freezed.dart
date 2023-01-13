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
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @DateTimeField()
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "friend_id")
  int? get friendID => throw _privateConstructorUsedError;

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
      {int? id,
      String name,
      @DateTimeField() DateTime date,
      @JsonKey(name: "friend_id") int? friendID});
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
    Object? id = freezed,
    Object? name = null,
    Object? date = null,
    Object? friendID = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      friendID: freezed == friendID
          ? _value.friendID
          : friendID // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? id,
      String name,
      @DateTimeField() DateTime date,
      @JsonKey(name: "friend_id") int? friendID});
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
    Object? id = freezed,
    Object? name = null,
    Object? date = null,
    Object? friendID = freezed,
  }) {
    return _then(_$_Anniversary(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      friendID: freezed == friendID
          ? _value.friendID
          : friendID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Anniversary implements _Anniversary {
  const _$_Anniversary(
      {this.id,
      required this.name,
      @DateTimeField() required this.date,
      @JsonKey(name: "friend_id") this.friendID});

  factory _$_Anniversary.fromJson(Map<String, dynamic> json) =>
      _$$_AnniversaryFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  @DateTimeField()
  final DateTime date;
  @override
  @JsonKey(name: "friend_id")
  final int? friendID;

  @override
  String toString() {
    return 'Anniversary(id: $id, name: $name, date: $date, friendID: $friendID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Anniversary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.friendID, friendID) ||
                other.friendID == friendID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, date, friendID);

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

abstract class _Anniversary implements Anniversary {
  const factory _Anniversary(
      {final int? id,
      required final String name,
      @DateTimeField() required final DateTime date,
      @JsonKey(name: "friend_id") final int? friendID}) = _$_Anniversary;

  factory _Anniversary.fromJson(Map<String, dynamic> json) =
      _$_Anniversary.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  @DateTimeField()
  DateTime get date;
  @override
  @JsonKey(name: "friend_id")
  int? get friendID;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryCopyWith<_$_Anniversary> get copyWith =>
      throw _privateConstructorUsedError;
}
