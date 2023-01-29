// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_data_edit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonDataEditForm {
  GlobalObjectKey<FormBuilderState> get nameAndIconKey =>
      throw _privateConstructorUsedError;
  GlobalObjectKey<FormBuilderState> get anniversaryListKey =>
      throw _privateConstructorUsedError;
  GlobalObjectKey<FormBuilderState> get contactListKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonDataEditFormCopyWith<PersonDataEditForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonDataEditFormCopyWith<$Res> {
  factory $PersonDataEditFormCopyWith(
          PersonDataEditForm value, $Res Function(PersonDataEditForm) then) =
      _$PersonDataEditFormCopyWithImpl<$Res, PersonDataEditForm>;
  @useResult
  $Res call(
      {GlobalObjectKey<FormBuilderState> nameAndIconKey,
      GlobalObjectKey<FormBuilderState> anniversaryListKey,
      GlobalObjectKey<FormBuilderState> contactListKey});
}

/// @nodoc
class _$PersonDataEditFormCopyWithImpl<$Res, $Val extends PersonDataEditForm>
    implements $PersonDataEditFormCopyWith<$Res> {
  _$PersonDataEditFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameAndIconKey = null,
    Object? anniversaryListKey = null,
    Object? contactListKey = null,
  }) {
    return _then(_value.copyWith(
      nameAndIconKey: null == nameAndIconKey
          ? _value.nameAndIconKey
          : nameAndIconKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
      anniversaryListKey: null == anniversaryListKey
          ? _value.anniversaryListKey
          : anniversaryListKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
      contactListKey: null == contactListKey
          ? _value.contactListKey
          : contactListKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonDataEditFormStateCopyWith<$Res>
    implements $PersonDataEditFormCopyWith<$Res> {
  factory _$$_PersonDataEditFormStateCopyWith(_$_PersonDataEditFormState value,
          $Res Function(_$_PersonDataEditFormState) then) =
      __$$_PersonDataEditFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GlobalObjectKey<FormBuilderState> nameAndIconKey,
      GlobalObjectKey<FormBuilderState> anniversaryListKey,
      GlobalObjectKey<FormBuilderState> contactListKey});
}

/// @nodoc
class __$$_PersonDataEditFormStateCopyWithImpl<$Res>
    extends _$PersonDataEditFormCopyWithImpl<$Res, _$_PersonDataEditFormState>
    implements _$$_PersonDataEditFormStateCopyWith<$Res> {
  __$$_PersonDataEditFormStateCopyWithImpl(_$_PersonDataEditFormState _value,
      $Res Function(_$_PersonDataEditFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameAndIconKey = null,
    Object? anniversaryListKey = null,
    Object? contactListKey = null,
  }) {
    return _then(_$_PersonDataEditFormState(
      nameAndIconKey: null == nameAndIconKey
          ? _value.nameAndIconKey
          : nameAndIconKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
      anniversaryListKey: null == anniversaryListKey
          ? _value.anniversaryListKey
          : anniversaryListKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
      contactListKey: null == contactListKey
          ? _value.contactListKey
          : contactListKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<FormBuilderState>,
    ));
  }
}

/// @nodoc

class _$_PersonDataEditFormState extends _PersonDataEditFormState {
  const _$_PersonDataEditFormState(
      {this.nameAndIconKey =
          const GlobalObjectKey<FormBuilderState>("basic_data"),
      this.anniversaryListKey =
          const GlobalObjectKey<FormBuilderState>("anniversary_list"),
      this.contactListKey =
          const GlobalObjectKey<FormBuilderState>("contact_list")})
      : super._();

  @override
  @JsonKey()
  final GlobalObjectKey<FormBuilderState> nameAndIconKey;
  @override
  @JsonKey()
  final GlobalObjectKey<FormBuilderState> anniversaryListKey;
  @override
  @JsonKey()
  final GlobalObjectKey<FormBuilderState> contactListKey;

  @override
  String toString() {
    return 'PersonDataEditForm(nameAndIconKey: $nameAndIconKey, anniversaryListKey: $anniversaryListKey, contactListKey: $contactListKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonDataEditFormState &&
            (identical(other.nameAndIconKey, nameAndIconKey) ||
                other.nameAndIconKey == nameAndIconKey) &&
            (identical(other.anniversaryListKey, anniversaryListKey) ||
                other.anniversaryListKey == anniversaryListKey) &&
            (identical(other.contactListKey, contactListKey) ||
                other.contactListKey == contactListKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, nameAndIconKey, anniversaryListKey, contactListKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonDataEditFormStateCopyWith<_$_PersonDataEditFormState>
      get copyWith =>
          __$$_PersonDataEditFormStateCopyWithImpl<_$_PersonDataEditFormState>(
              this, _$identity);
}

abstract class _PersonDataEditFormState extends PersonDataEditForm {
  const factory _PersonDataEditFormState(
          {final GlobalObjectKey<FormBuilderState> nameAndIconKey,
          final GlobalObjectKey<FormBuilderState> anniversaryListKey,
          final GlobalObjectKey<FormBuilderState> contactListKey}) =
      _$_PersonDataEditFormState;
  const _PersonDataEditFormState._() : super._();

  @override
  GlobalObjectKey<FormBuilderState> get nameAndIconKey;
  @override
  GlobalObjectKey<FormBuilderState> get anniversaryListKey;
  @override
  GlobalObjectKey<FormBuilderState> get contactListKey;
  @override
  @JsonKey(ignore: true)
  _$$_PersonDataEditFormStateCopyWith<_$_PersonDataEditFormState>
      get copyWith => throw _privateConstructorUsedError;
}
