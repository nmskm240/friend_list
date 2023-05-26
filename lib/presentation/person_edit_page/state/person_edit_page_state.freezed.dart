// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_edit_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonEditPageState {
  Person get person => throw _privateConstructorUsedError;
  bool get shouldRefreshWidget => throw _privateConstructorUsedError;
  GlobalKey<FormBuilderState> get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonEditPageStateCopyWith<PersonEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonEditPageStateCopyWith<$Res> {
  factory $PersonEditPageStateCopyWith(
          PersonEditPageState value, $Res Function(PersonEditPageState) then) =
      _$PersonEditPageStateCopyWithImpl<$Res, PersonEditPageState>;
  @useResult
  $Res call(
      {Person person,
      bool shouldRefreshWidget,
      GlobalKey<FormBuilderState> key});
}

/// @nodoc
class _$PersonEditPageStateCopyWithImpl<$Res, $Val extends PersonEditPageState>
    implements $PersonEditPageStateCopyWith<$Res> {
  _$PersonEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? shouldRefreshWidget = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      shouldRefreshWidget: null == shouldRefreshWidget
          ? _value.shouldRefreshWidget
          : shouldRefreshWidget // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonEditPageStateCopyWith<$Res>
    implements $PersonEditPageStateCopyWith<$Res> {
  factory _$$_PersonEditPageStateCopyWith(_$_PersonEditPageState value,
          $Res Function(_$_PersonEditPageState) then) =
      __$$_PersonEditPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Person person,
      bool shouldRefreshWidget,
      GlobalKey<FormBuilderState> key});
}

/// @nodoc
class __$$_PersonEditPageStateCopyWithImpl<$Res>
    extends _$PersonEditPageStateCopyWithImpl<$Res, _$_PersonEditPageState>
    implements _$$_PersonEditPageStateCopyWith<$Res> {
  __$$_PersonEditPageStateCopyWithImpl(_$_PersonEditPageState _value,
      $Res Function(_$_PersonEditPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? shouldRefreshWidget = null,
    Object? key = null,
  }) {
    return _then(_$_PersonEditPageState(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      shouldRefreshWidget: null == shouldRefreshWidget
          ? _value.shouldRefreshWidget
          : shouldRefreshWidget // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ));
  }
}

/// @nodoc

class _$_PersonEditPageState extends _PersonEditPageState {
  const _$_PersonEditPageState(
      {required this.person,
      this.shouldRefreshWidget = false,
      required this.key})
      : super._();

  @override
  final Person person;
  @override
  @JsonKey()
  final bool shouldRefreshWidget;
  @override
  final GlobalKey<FormBuilderState> key;

  @override
  String toString() {
    return 'PersonEditPageState(person: $person, shouldRefreshWidget: $shouldRefreshWidget, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonEditPageState &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.shouldRefreshWidget, shouldRefreshWidget) ||
                other.shouldRefreshWidget == shouldRefreshWidget) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, person, shouldRefreshWidget, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonEditPageStateCopyWith<_$_PersonEditPageState> get copyWith =>
      __$$_PersonEditPageStateCopyWithImpl<_$_PersonEditPageState>(
          this, _$identity);
}

abstract class _PersonEditPageState extends PersonEditPageState {
  const factory _PersonEditPageState(
      {required final Person person,
      final bool shouldRefreshWidget,
      required final GlobalKey<FormBuilderState> key}) = _$_PersonEditPageState;
  const _PersonEditPageState._() : super._();

  @override
  Person get person;
  @override
  bool get shouldRefreshWidget;
  @override
  GlobalKey<FormBuilderState> get key;
  @override
  @JsonKey(ignore: true)
  _$$_PersonEditPageStateCopyWith<_$_PersonEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
