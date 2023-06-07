// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  @JsonKey(name: Strings.jsonKeyId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyName)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
  ContactMethod get method => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyValue)
  String get value => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyPersonId)
  String get personId => throw _privateConstructorUsedError;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
          ContactMethod method,
      @JsonKey(name: Strings.jsonKeyValue)
          String value,
      @JsonKey(name: Strings.jsonKeyPersonId)
          String personId,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

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
    Object? personId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
          _$_Contact value, $Res Function(_$_Contact) then) =
      __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
          ContactMethod method,
      @JsonKey(name: Strings.jsonKeyValue)
          String value,
      @JsonKey(name: Strings.jsonKeyPersonId)
          String personId,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? method = null,
    Object? value = null,
    Object? personId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Contact(
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
      personId: null == personId
          ? _value.personId
          : personId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact extends _Contact {
  const _$_Contact(
      {@JsonKey(name: Strings.jsonKeyId)
          required this.id,
      @JsonKey(name: Strings.jsonKeyName)
          required this.name,
      @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
          required this.method,
      @JsonKey(name: Strings.jsonKeyValue)
          required this.value,
      @JsonKey(name: Strings.jsonKeyPersonId)
          required this.personId,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          this.createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          this.updatedAt})
      : super._();

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$$_ContactFromJson(json);

  @override
  @JsonKey(name: Strings.jsonKeyId)
  final String id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  final String name;
  @override
  @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
  final ContactMethod method;
  @override
  @JsonKey(name: Strings.jsonKeyValue)
  final String value;
  @override
  @JsonKey(name: Strings.jsonKeyPersonId)
  final String personId;
  @override
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  final DateTime? createdAt;
  @override
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, method: $method, value: $value, personId: $personId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, method, value, personId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactToJson(
      this,
    );
  }
}

abstract class _Contact extends Contact {
  const factory _Contact(
      {@JsonKey(name: Strings.jsonKeyId)
          required final String id,
      @JsonKey(name: Strings.jsonKeyName)
          required final String name,
      @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
          required final ContactMethod method,
      @JsonKey(name: Strings.jsonKeyValue)
          required final String value,
      @JsonKey(name: Strings.jsonKeyPersonId)
          required final String personId,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          final DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          final DateTime? updatedAt}) = _$_Contact;
  const _Contact._() : super._();

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  @JsonKey(name: Strings.jsonKeyId)
  String get id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  String get name;
  @override
  @JsonKey(name: Strings.jsonKeyMethod, unknownEnumValue: ContactMethod.unknown)
  ContactMethod get method;
  @override
  @JsonKey(name: Strings.jsonKeyValue)
  String get value;
  @override
  @JsonKey(name: Strings.jsonKeyPersonId)
  String get personId;
  @override
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  DateTime? get createdAt;
  @override
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}
