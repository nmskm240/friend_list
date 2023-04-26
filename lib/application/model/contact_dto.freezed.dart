// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ContactMethod get method => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactDtoCopyWith<ContactDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactDtoCopyWith<$Res> {
  factory $ContactDtoCopyWith(
          ContactDto value, $Res Function(ContactDto) then) =
      _$ContactDtoCopyWithImpl<$Res, ContactDto>;
  @useResult
  $Res call({String id, String name, ContactMethod method, String value});
}

/// @nodoc
class _$ContactDtoCopyWithImpl<$Res, $Val extends ContactDto>
    implements $ContactDtoCopyWith<$Res> {
  _$ContactDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? method = null,
    Object? value = null,
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
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as ContactMethod,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactDtoCopyWith<$Res>
    implements $ContactDtoCopyWith<$Res> {
  factory _$$_ContactDtoCopyWith(
          _$_ContactDto value, $Res Function(_$_ContactDto) then) =
      __$$_ContactDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, ContactMethod method, String value});
}

/// @nodoc
class __$$_ContactDtoCopyWithImpl<$Res>
    extends _$ContactDtoCopyWithImpl<$Res, _$_ContactDto>
    implements _$$_ContactDtoCopyWith<$Res> {
  __$$_ContactDtoCopyWithImpl(
      _$_ContactDto _value, $Res Function(_$_ContactDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? method = null,
    Object? value = null,
  }) {
    return _then(_$_ContactDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as ContactMethod,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ContactDto implements _ContactDto {
  const _$_ContactDto(
      {this.id = "",
      this.name = "",
      this.method = ContactMethod.phone,
      this.value = ""});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final ContactMethod method;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'ContactDto(id: $id, name: $name, method: $method, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, method, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactDtoCopyWith<_$_ContactDto> get copyWith =>
      __$$_ContactDtoCopyWithImpl<_$_ContactDto>(this, _$identity);
}

abstract class _ContactDto implements ContactDto {
  const factory _ContactDto(
      {final String id,
      final String name,
      final ContactMethod method,
      final String value}) = _$_ContactDto;

  @override
  String get id;
  @override
  String get name;
  @override
  ContactMethod get method;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_ContactDtoCopyWith<_$_ContactDto> get copyWith =>
      throw _privateConstructorUsedError;
}
