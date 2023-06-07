// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  @JsonKey(name: Strings.jsonKeyId)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyName)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.jsonKeyNickname)
  String get nickname => throw _privateConstructorUsedError;
  @Uint8ListField()
  @JsonKey(name: Strings.jsonKeyIcon)
  Uint8List get icon => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<Anniversary> get anniversaries => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<Contact> get contacts => throw _privateConstructorUsedError;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyNickname)
          String nickname,
      @Uint8ListField()
      @JsonKey(name: Strings.jsonKeyIcon)
          Uint8List icon,
      @JsonKey(includeToJson: false)
          List<Anniversary> anniversaries,
      @JsonKey(includeToJson: false)
          List<Contact> contacts,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

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
    Object? anniversaries = null,
    Object? contacts = null,
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
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      anniversaries: null == anniversaries
          ? _value.anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
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
abstract class _$$_PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$_PersonCopyWith(_$_Person value, $Res Function(_$_Person) then) =
      __$$_PersonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Strings.jsonKeyId)
          String id,
      @JsonKey(name: Strings.jsonKeyName)
          String name,
      @JsonKey(name: Strings.jsonKeyNickname)
          String nickname,
      @Uint8ListField()
      @JsonKey(name: Strings.jsonKeyIcon)
          Uint8List icon,
      @JsonKey(includeToJson: false)
          List<Anniversary> anniversaries,
      @JsonKey(includeToJson: false)
          List<Contact> contacts,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          DateTime? updatedAt});
}

/// @nodoc
class __$$_PersonCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$_Person>
    implements _$$_PersonCopyWith<$Res> {
  __$$_PersonCopyWithImpl(_$_Person _value, $Res Function(_$_Person) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
    Object? anniversaries = null,
    Object? contacts = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Person(
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
      anniversaries: null == anniversaries
          ? _value._anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
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
class _$_Person extends _Person {
  const _$_Person(
      {@JsonKey(name: Strings.jsonKeyId)
          required this.id,
      @JsonKey(name: Strings.jsonKeyName)
          required this.name,
      @JsonKey(name: Strings.jsonKeyNickname)
          this.nickname = "",
      @Uint8ListField()
      @JsonKey(name: Strings.jsonKeyIcon)
          required this.icon,
      @JsonKey(includeToJson: false)
          final List<Anniversary> anniversaries = const <Anniversary>[],
      @JsonKey(includeToJson: false)
          final List<Contact> contacts = const <Contact>[],
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          this.createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          this.updatedAt})
      : _anniversaries = anniversaries,
        _contacts = contacts,
        super._();

  factory _$_Person.fromJson(Map<String, dynamic> json) =>
      _$$_PersonFromJson(json);

  @override
  @JsonKey(name: Strings.jsonKeyId)
  final String id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  final String name;
  @override
  @JsonKey(name: Strings.jsonKeyNickname)
  final String nickname;
  @override
  @Uint8ListField()
  @JsonKey(name: Strings.jsonKeyIcon)
  final Uint8List icon;
  final List<Anniversary> _anniversaries;
  @override
  @JsonKey(includeToJson: false)
  List<Anniversary> get anniversaries {
    if (_anniversaries is EqualUnmodifiableListView) return _anniversaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anniversaries);
  }

  final List<Contact> _contacts;
  @override
  @JsonKey(includeToJson: false)
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

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
    return 'Person(id: $id, name: $name, nickname: $nickname, icon: $icon, anniversaries: $anniversaries, contacts: $contacts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Person &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality()
                .equals(other._anniversaries, _anniversaries) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nickname,
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(_anniversaries),
      const DeepCollectionEquality().hash(_contacts),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      __$$_PersonCopyWithImpl<_$_Person>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonToJson(
      this,
    );
  }
}

abstract class _Person extends Person {
  const factory _Person(
      {@JsonKey(name: Strings.jsonKeyId)
          required final String id,
      @JsonKey(name: Strings.jsonKeyName)
          required final String name,
      @JsonKey(name: Strings.jsonKeyNickname)
          final String nickname,
      @Uint8ListField()
      @JsonKey(name: Strings.jsonKeyIcon)
          required final Uint8List icon,
      @JsonKey(includeToJson: false)
          final List<Anniversary> anniversaries,
      @JsonKey(includeToJson: false)
          final List<Contact> contacts,
      @CreatedAtField()
      @JsonKey(name: Strings.jsonKeyCreatedAt)
          final DateTime? createdAt,
      @UpdatedAtField()
      @JsonKey(name: Strings.jsonKeyUpdatedAt)
          final DateTime? updatedAt}) = _$_Person;
  const _Person._() : super._();

  factory _Person.fromJson(Map<String, dynamic> json) = _$_Person.fromJson;

  @override
  @JsonKey(name: Strings.jsonKeyId)
  String get id;
  @override
  @JsonKey(name: Strings.jsonKeyName)
  String get name;
  @override
  @JsonKey(name: Strings.jsonKeyNickname)
  String get nickname;
  @override
  @Uint8ListField()
  @JsonKey(name: Strings.jsonKeyIcon)
  Uint8List get icon;
  @override
  @JsonKey(includeToJson: false)
  List<Anniversary> get anniversaries;
  @override
  @JsonKey(includeToJson: false)
  List<Contact> get contacts;
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
  _$$_PersonCopyWith<_$_Person> get copyWith =>
      throw _privateConstructorUsedError;
}
