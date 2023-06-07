// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_edit_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryEditPageState {
  @protected
  Person get person => throw _privateConstructorUsedError;
  @protected
  Anniversary get anniversary => throw _privateConstructorUsedError;
  @protected
  GlobalKey<FormBuilderState> get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryEditPageStateCopyWith<AnniversaryEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryEditPageStateCopyWith<$Res> {
  factory $AnniversaryEditPageStateCopyWith(AnniversaryEditPageState value,
          $Res Function(AnniversaryEditPageState) then) =
      _$AnniversaryEditPageStateCopyWithImpl<$Res, AnniversaryEditPageState>;
  @useResult
  $Res call(
      {@protected Person person,
      @protected Anniversary anniversary,
      @protected GlobalKey<FormBuilderState> key});

  $PersonCopyWith<$Res> get person;
  $AnniversaryCopyWith<$Res> get anniversary;
}

/// @nodoc
class _$AnniversaryEditPageStateCopyWithImpl<$Res,
        $Val extends AnniversaryEditPageState>
    implements $AnniversaryEditPageStateCopyWith<$Res> {
  _$AnniversaryEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? anniversary = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      anniversary: null == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as Anniversary,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnniversaryCopyWith<$Res> get anniversary {
    return $AnniversaryCopyWith<$Res>(_value.anniversary, (value) {
      return _then(_value.copyWith(anniversary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnniversaryEditPageStateCopyWith<$Res>
    implements $AnniversaryEditPageStateCopyWith<$Res> {
  factory _$$_AnniversaryEditPageStateCopyWith(
          _$_AnniversaryEditPageState value,
          $Res Function(_$_AnniversaryEditPageState) then) =
      __$$_AnniversaryEditPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected Person person,
      @protected Anniversary anniversary,
      @protected GlobalKey<FormBuilderState> key});

  @override
  $PersonCopyWith<$Res> get person;
  @override
  $AnniversaryCopyWith<$Res> get anniversary;
}

/// @nodoc
class __$$_AnniversaryEditPageStateCopyWithImpl<$Res>
    extends _$AnniversaryEditPageStateCopyWithImpl<$Res,
        _$_AnniversaryEditPageState>
    implements _$$_AnniversaryEditPageStateCopyWith<$Res> {
  __$$_AnniversaryEditPageStateCopyWithImpl(_$_AnniversaryEditPageState _value,
      $Res Function(_$_AnniversaryEditPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? anniversary = null,
    Object? key = null,
  }) {
    return _then(_$_AnniversaryEditPageState(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      anniversary: null == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as Anniversary,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ));
  }
}

/// @nodoc

class _$_AnniversaryEditPageState extends _AnniversaryEditPageState {
  const _$_AnniversaryEditPageState(
      {@protected required this.person,
      @protected required this.anniversary,
      @protected required this.key})
      : super._();

  @override
  @protected
  final Person person;
  @override
  @protected
  final Anniversary anniversary;
  @override
  @protected
  final GlobalKey<FormBuilderState> key;

  @override
  String toString() {
    return 'AnniversaryEditPageState(person: $person, anniversary: $anniversary, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryEditPageState &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, anniversary, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryEditPageStateCopyWith<_$_AnniversaryEditPageState>
      get copyWith => __$$_AnniversaryEditPageStateCopyWithImpl<
          _$_AnniversaryEditPageState>(this, _$identity);
}

abstract class _AnniversaryEditPageState extends AnniversaryEditPageState {
  const factory _AnniversaryEditPageState(
          {@protected required final Person person,
          @protected required final Anniversary anniversary,
          @protected required final GlobalKey<FormBuilderState> key}) =
      _$_AnniversaryEditPageState;
  const _AnniversaryEditPageState._() : super._();

  @override
  @protected
  Person get person;
  @override
  @protected
  Anniversary get anniversary;
  @override
  @protected
  GlobalKey<FormBuilderState> get key;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryEditPageStateCopyWith<_$_AnniversaryEditPageState>
      get copyWith => throw _privateConstructorUsedError;
}
