// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_detail_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonDetailPageState {
  @protected
  Person get domain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonDetailPageStateCopyWith<PersonDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDetailPageStateCopyWith<$Res> {
  factory $PersonDetailPageStateCopyWith(PersonDetailPageState value,
          $Res Function(PersonDetailPageState) then) =
      _$PersonDetailPageStateCopyWithImpl<$Res, PersonDetailPageState>;
  @useResult
  $Res call({@protected Person domain});
}

/// @nodoc
class _$PersonDetailPageStateCopyWithImpl<$Res,
        $Val extends PersonDetailPageState>
    implements $PersonDetailPageStateCopyWith<$Res> {
  _$PersonDetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
  }) {
    return _then(_value.copyWith(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as Person,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonDetailPageStateCopyWith<$Res>
    implements $PersonDetailPageStateCopyWith<$Res> {
  factory _$$_PersonDetailPageStateCopyWith(_$_PersonDetailPageState value,
          $Res Function(_$_PersonDetailPageState) then) =
      __$$_PersonDetailPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@protected Person domain});
}

/// @nodoc
class __$$_PersonDetailPageStateCopyWithImpl<$Res>
    extends _$PersonDetailPageStateCopyWithImpl<$Res, _$_PersonDetailPageState>
    implements _$$_PersonDetailPageStateCopyWith<$Res> {
  __$$_PersonDetailPageStateCopyWithImpl(_$_PersonDetailPageState _value,
      $Res Function(_$_PersonDetailPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
  }) {
    return _then(_$_PersonDetailPageState(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as Person,
    ));
  }
}

/// @nodoc

class _$_PersonDetailPageState extends _PersonDetailPageState {
  const _$_PersonDetailPageState({@protected required this.domain}) : super._();

  @override
  @protected
  final Person domain;

  @override
  String toString() {
    return 'PersonDetailPageState(domain: $domain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonDetailPageState &&
            (identical(other.domain, domain) || other.domain == domain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, domain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonDetailPageStateCopyWith<_$_PersonDetailPageState> get copyWith =>
      __$$_PersonDetailPageStateCopyWithImpl<_$_PersonDetailPageState>(
          this, _$identity);
}

abstract class _PersonDetailPageState extends PersonDetailPageState {
  const factory _PersonDetailPageState(
      {@protected required final Person domain}) = _$_PersonDetailPageState;
  const _PersonDetailPageState._() : super._();

  @override
  @protected
  Person get domain;
  @override
  @JsonKey(ignore: true)
  _$$_PersonDetailPageStateCopyWith<_$_PersonDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
