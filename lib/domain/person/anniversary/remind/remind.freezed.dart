// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Remind _$RemindFromJson(Map<String, dynamic> json) {
  return _Remind.fromJson(json);
}

/// @nodoc
mixin _$Remind {
  @JsonKey(name: Strings.jsonKeyAnniversaryId)
  String get anniversaryId => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyRemindTiming)
  int get timing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemindCopyWith<Remind> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindCopyWith<$Res> {
  factory $RemindCopyWith(Remind value, $Res Function(Remind) then) =
      _$RemindCopyWithImpl<$Res, Remind>;
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyAnniversaryId) String anniversaryId,
      @JsonKey(name: Strings.jsonKeyRemindTiming) int timing});
}

/// @nodoc
class _$RemindCopyWithImpl<$Res, $Val extends Remind>
    implements $RemindCopyWith<$Res> {
  _$RemindCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anniversaryId = null,
    Object? timing = null,
  }) {
    return _then(_value.copyWith(
      anniversaryId: null == anniversaryId
          ? _value.anniversaryId
          : anniversaryId // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemindCopyWith<$Res> implements $RemindCopyWith<$Res> {
  factory _$$_RemindCopyWith(_$_Remind value, $Res Function(_$_Remind) then) =
      __$$_RemindCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyAnniversaryId) String anniversaryId,
      @JsonKey(name: Strings.jsonKeyRemindTiming) int timing});
}

/// @nodoc
class __$$_RemindCopyWithImpl<$Res>
    extends _$RemindCopyWithImpl<$Res, _$_Remind>
    implements _$$_RemindCopyWith<$Res> {
  __$$_RemindCopyWithImpl(_$_Remind _value, $Res Function(_$_Remind) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anniversaryId = null,
    Object? timing = null,
  }) {
    return _then(_$_Remind(
      anniversaryId: null == anniversaryId
          ? _value.anniversaryId
          : anniversaryId // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Remind implements _Remind {
  const _$_Remind(
      {@JsonKey(name: Strings.jsonKeyAnniversaryId) required this.anniversaryId,
      @JsonKey(name: Strings.jsonKeyRemindTiming) required this.timing});

  factory _$_Remind.fromJson(Map<String, dynamic> json) =>
      _$$_RemindFromJson(json);

  @override
  @JsonKey(name: Strings.jsonKeyAnniversaryId)
  final String anniversaryId;
  @override
  @JsonKey(name: Strings.jsonKeyRemindTiming)
  final int timing;

  @override
  String toString() {
    return 'Remind(anniversaryId: $anniversaryId, timing: $timing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Remind &&
            (identical(other.anniversaryId, anniversaryId) ||
                other.anniversaryId == anniversaryId) &&
            (identical(other.timing, timing) || other.timing == timing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, anniversaryId, timing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemindCopyWith<_$_Remind> get copyWith =>
      __$$_RemindCopyWithImpl<_$_Remind>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemindToJson(
      this,
    );
  }
}

abstract class _Remind implements Remind {
  const factory _Remind(
      {@JsonKey(name: Strings.jsonKeyAnniversaryId)
          required final String anniversaryId,
      @JsonKey(name: Strings.jsonKeyRemindTiming)
          required final int timing}) = _$_Remind;

  factory _Remind.fromJson(Map<String, dynamic> json) = _$_Remind.fromJson;

  @override
  @JsonKey(name: Strings.jsonKeyAnniversaryId)
  String get anniversaryId;
  @override
  @JsonKey(name: Strings.jsonKeyRemindTiming)
  int get timing;
  @override
  @JsonKey(ignore: true)
  _$$_RemindCopyWith<_$_Remind> get copyWith =>
      throw _privateConstructorUsedError;
}
