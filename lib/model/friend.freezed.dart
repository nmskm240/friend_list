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
  String get name => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get iconPath => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  List<Anniversary>? get anniversaries => throw _privateConstructorUsedError;
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
      {String name,
      String? nickname,
      String? iconPath,
      DateTime? birthday,
      List<Anniversary>? anniversaries,
      List<Contact>? contacts});
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
    Object? name = null,
    Object? nickname = freezed,
    Object? iconPath = freezed,
    Object? birthday = freezed,
    Object? anniversaries = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
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
      {String name,
      String? nickname,
      String? iconPath,
      DateTime? birthday,
      List<Anniversary>? anniversaries,
      List<Contact>? contacts});
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
    Object? name = null,
    Object? nickname = freezed,
    Object? iconPath = freezed,
    Object? birthday = freezed,
    Object? anniversaries = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_$_Friend(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: freezed == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
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
      {required this.name,
      this.nickname,
      this.iconPath,
      this.birthday,
      final List<Anniversary>? anniversaries,
      final List<Contact>? contacts})
      : _anniversaries = anniversaries,
        _contacts = contacts,
        super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  final String name;
  @override
  final String? nickname;
  @override
  final String? iconPath;
  @override
  final DateTime? birthday;
  final List<Anniversary>? _anniversaries;
  @override
  List<Anniversary>? get anniversaries {
    final value = _anniversaries;
    if (value == null) return null;
    if (_anniversaries is EqualUnmodifiableListView) return _anniversaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Contact>? _contacts;
  @override
  List<Contact>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Friend(name: $name, nickname: $nickname, iconPath: $iconPath, birthday: $birthday, anniversaries: $anniversaries, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friend &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
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
      name,
      nickname,
      iconPath,
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
      {required final String name,
      final String? nickname,
      final String? iconPath,
      final DateTime? birthday,
      final List<Anniversary>? anniversaries,
      final List<Contact>? contacts}) = _$_Friend;
  const _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  String get name;
  @override
  String? get nickname;
  @override
  String? get iconPath;
  @override
  DateTime? get birthday;
  @override
  List<Anniversary>? get anniversaries;
  @override
  List<Contact>? get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      throw _privateConstructorUsedError;
}
