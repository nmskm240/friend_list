// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryDtoCopyWith<AnniversaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryDtoCopyWith<$Res> {
  factory $AnniversaryDtoCopyWith(
          AnniversaryDto value, $Res Function(AnniversaryDto) then) =
      _$AnniversaryDtoCopyWithImpl<$Res, AnniversaryDto>;
  @useResult
  $Res call({String id, String name, DateTime date});
}

/// @nodoc
class _$AnniversaryDtoCopyWithImpl<$Res, $Val extends AnniversaryDto>
    implements $AnniversaryDtoCopyWith<$Res> {
  _$AnniversaryDtoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnniversaryDtoCopyWith<$Res>
    implements $AnniversaryDtoCopyWith<$Res> {
  factory _$$_AnniversaryDtoCopyWith(
          _$_AnniversaryDto value, $Res Function(_$_AnniversaryDto) then) =
      __$$_AnniversaryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, DateTime date});
}

/// @nodoc
class __$$_AnniversaryDtoCopyWithImpl<$Res>
    extends _$AnniversaryDtoCopyWithImpl<$Res, _$_AnniversaryDto>
    implements _$$_AnniversaryDtoCopyWith<$Res> {
  __$$_AnniversaryDtoCopyWithImpl(
      _$_AnniversaryDto _value, $Res Function(_$_AnniversaryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
  }) {
    return _then(_$_AnniversaryDto(
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
    ));
  }
}

/// @nodoc

class _$_AnniversaryDto implements _AnniversaryDto {
  const _$_AnniversaryDto(
      {this.id = "", required this.name, required this.date});

  @override
  @JsonKey()
  final String id;
  @override
  final String name;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'AnniversaryDto(id: $id, name: $name, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryDtoCopyWith<_$_AnniversaryDto> get copyWith =>
      __$$_AnniversaryDtoCopyWithImpl<_$_AnniversaryDto>(this, _$identity);
}

abstract class _AnniversaryDto implements AnniversaryDto {
  const factory _AnniversaryDto(
      {final String id,
      required final String name,
      required final DateTime date}) = _$_AnniversaryDto;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryDtoCopyWith<_$_AnniversaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
