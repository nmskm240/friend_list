// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  @DateTimeField()
  DateTime? get birthday => throw _privateConstructorUsedError;
  @AnniversaryListField()
  List<Anniversary>? get anniversaries => throw _privateConstructorUsedError;
  @ContactListField()
  List<Contact>? get contacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res, Friend>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? nickname,
      String? icon,
      @DateTimeField() DateTime? birthday,
      @AnniversaryListField() List<Anniversary>? anniversaries,
      @ContactListField() List<Contact>? contacts});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res, $Val extends Friend>
    implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? nickname = freezed,
    Object? icon = freezed,
    Object? birthday = freezed,
    Object? anniversaries = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversaries: freezed == anniversaries
          ? _value.anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$_FriendCopyWith(_$_Friend value, $Res Function(_$_Friend) then) =
      __$$_FriendCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? nickname,
      String? icon,
      @DateTimeField() DateTime? birthday,
      @AnniversaryListField() List<Anniversary>? anniversaries,
      @ContactListField() List<Contact>? contacts});
}

/// @nodoc
class __$$_FriendCopyWithImpl<$Res>
    extends _$FriendCopyWithImpl<$Res, _$_Friend>
    implements _$$_FriendCopyWith<$Res> {
  __$$_FriendCopyWithImpl(_$_Friend _value, $Res Function(_$_Friend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? nickname = freezed,
    Object? icon = freezed,
    Object? birthday = freezed,
    Object? anniversaries = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_$_Friend(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversaries: freezed == anniversaries
          ? _value._anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>?,
      contacts: freezed == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friend extends _Friend {
  const _$_Friend(
      {this.id,
      required this.name,
      this.nickname,
      this.icon,
      @DateTimeField() this.birthday,
      @AnniversaryListField() final List<Anniversary>? anniversaries,
      @ContactListField() final List<Contact>? contacts})
      : _anniversaries = anniversaries,
        _contacts = contacts,
        super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? nickname;
  @override
  final String? icon;
  @override
  @DateTimeField()
  final DateTime? birthday;
  final List<Anniversary>? _anniversaries;
  @override
  @AnniversaryListField()
  List<Anniversary>? get anniversaries {
    final value = _anniversaries;
    if (value == null) return null;
    if (_anniversaries is EqualUnmodifiableListView) return _anniversaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Contact>? _contacts;
  @override
  @ContactListField()
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Friend(id: $id, name: $name, nickname: $nickname, icon: $icon, birthday: $birthday, anniversaries: $anniversaries, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friend &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            const DeepCollectionEquality()
                .equals(other._anniversaries, _anniversaries) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nickname,
      icon,
      birthday,
      const DeepCollectionEquality().hash(_anniversaries),
      const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      __$$_FriendCopyWithImpl<_$_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendToJson(
      this,
    );
  }
}

abstract class _Friend extends Friend {
  const factory _Friend(
      {final int? id,
      required final String name,
      final String? nickname,
      final String? icon,
      @DateTimeField() final DateTime? birthday,
      @AnniversaryListField() final List<Anniversary>? anniversaries,
      @ContactListField() final List<Contact>? contacts}) = _$_Friend;
  const _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get nickname;
  @override
  String? get icon;
  @override
  @DateTimeField()
  DateTime? get birthday;
  @override
  @AnniversaryListField()
  List<Anniversary>? get anniversaries;
  @override
  @ContactListField()
  List<Contact>? get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      throw _privateConstructorUsedError;
}
