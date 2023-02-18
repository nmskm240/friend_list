// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  Uint8List get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonSummaryCopyWith<PersonSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonSummaryCopyWith<$Res> {
  factory $PersonSummaryCopyWith(
          PersonSummary value, $Res Function(PersonSummary) then) =
      _$PersonSummaryCopyWithImpl<$Res, PersonSummary>;
  @useResult
  $Res call({String id, String name, String nickname, Uint8List icon});
}

/// @nodoc
class _$PersonSummaryCopyWithImpl<$Res, $Val extends PersonSummary>
    implements $PersonSummaryCopyWith<$Res> {
  _$PersonSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
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
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonSummaryCopyWith<$Res>
    implements $PersonSummaryCopyWith<$Res> {
  factory _$$_PersonSummaryCopyWith(
          _$_PersonSummary value, $Res Function(_$_PersonSummary) then) =
      __$$_PersonSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String nickname, Uint8List icon});
}

/// @nodoc
class __$$_PersonSummaryCopyWithImpl<$Res>
    extends _$PersonSummaryCopyWithImpl<$Res, _$_PersonSummary>
    implements _$$_PersonSummaryCopyWith<$Res> {
  __$$_PersonSummaryCopyWithImpl(
      _$_PersonSummary _value, $Res Function(_$_PersonSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
  }) {
    return _then(_$_PersonSummary(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$_PersonSummary with DiagnosticableTreeMixin implements _PersonSummary {
  const _$_PersonSummary(this.id, this.name, this.nickname, this.icon);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nickname;
  @override
  final Uint8List icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonSummary(id: $id, name: $name, nickname: $nickname, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonSummary'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, nickname,
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonSummaryCopyWith<_$_PersonSummary> get copyWith =>
      __$$_PersonSummaryCopyWithImpl<_$_PersonSummary>(this, _$identity);
}

abstract class _PersonSummary implements PersonSummary {
  const factory _PersonSummary(final String id, final String name,
      final String nickname, final Uint8List icon) = _$_PersonSummary;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nickname;
  @override
  Uint8List get icon;
  @override
  @JsonKey(ignore: true)
  _$$_PersonSummaryCopyWith<_$_PersonSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
