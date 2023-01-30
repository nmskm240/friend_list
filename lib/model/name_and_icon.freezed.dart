// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_and_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NameAndIcon {
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NameAndIconCopyWith<NameAndIcon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameAndIconCopyWith<$Res> {
  factory $NameAndIconCopyWith(
          NameAndIcon value, $Res Function(NameAndIcon) then) =
      _$NameAndIconCopyWithImpl<$Res, NameAndIcon>;
  @useResult
  $Res call({String name, String nickname, String icon});
}

/// @nodoc
class _$NameAndIconCopyWithImpl<$Res, $Val extends NameAndIcon>
    implements $NameAndIconCopyWith<$Res> {
  _$NameAndIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameAndIconCopyWith<$Res>
    implements $NameAndIconCopyWith<$Res> {
  factory _$$_NameAndIconCopyWith(
          _$_NameAndIcon value, $Res Function(_$_NameAndIcon) then) =
      __$$_NameAndIconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String nickname, String icon});
}

/// @nodoc
class __$$_NameAndIconCopyWithImpl<$Res>
    extends _$NameAndIconCopyWithImpl<$Res, _$_NameAndIcon>
    implements _$$_NameAndIconCopyWith<$Res> {
  __$$_NameAndIconCopyWithImpl(
      _$_NameAndIcon _value, $Res Function(_$_NameAndIcon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
  }) {
    return _then(_$_NameAndIcon(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameAndIcon implements _NameAndIcon {
  const _$_NameAndIcon({this.name = "", this.nickname = "", this.icon = ""});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey()
  final String icon;

  @override
  String toString() {
    return 'NameAndIcon(name: $name, nickname: $nickname, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameAndIcon &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, nickname, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameAndIconCopyWith<_$_NameAndIcon> get copyWith =>
      __$$_NameAndIconCopyWithImpl<_$_NameAndIcon>(this, _$identity);
}

abstract class _NameAndIcon implements NameAndIcon {
  const factory _NameAndIcon(
      {final String name,
      final String nickname,
      final String icon}) = _$_NameAndIcon;

  @override
  String get name;
  @override
  String get nickname;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_NameAndIconCopyWith<_$_NameAndIcon> get copyWith =>
      throw _privateConstructorUsedError;
}
