// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditData {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  List<Anniversary> get anniversaries => throw _privateConstructorUsedError;
  List<Contact> get contacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditDataCopyWith<EditData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditDataCopyWith<$Res> {
  factory $EditDataCopyWith(EditData value, $Res Function(EditData) then) =
      _$EditDataCopyWithImpl<$Res, EditData>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String nickname,
      String icon,
      DateTime? birthday,
      List<Anniversary> anniversaries,
      List<Contact> contacts});
}

/// @nodoc
class _$EditDataCopyWithImpl<$Res, $Val extends EditData>
    implements $EditDataCopyWith<$Res> {
  _$EditDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
    Object? birthday = freezed,
    Object? anniversaries = null,
    Object? contacts = null,
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
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversaries: null == anniversaries
          ? _value.anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditDataCopyWith<$Res> implements $EditDataCopyWith<$Res> {
  factory _$$_EditDataCopyWith(
          _$_EditData value, $Res Function(_$_EditData) then) =
      __$$_EditDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String nickname,
      String icon,
      DateTime? birthday,
      List<Anniversary> anniversaries,
      List<Contact> contacts});
}

/// @nodoc
class __$$_EditDataCopyWithImpl<$Res>
    extends _$EditDataCopyWithImpl<$Res, _$_EditData>
    implements _$$_EditDataCopyWith<$Res> {
  __$$_EditDataCopyWithImpl(
      _$_EditData _value, $Res Function(_$_EditData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? nickname = null,
    Object? icon = null,
    Object? birthday = freezed,
    Object? anniversaries = null,
    Object? contacts = null,
  }) {
    return _then(_$_EditData(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversaries: null == anniversaries
          ? _value._anniversaries
          : anniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc

class _$_EditData implements _EditData {
  const _$_EditData(
      {this.id,
      this.name = "",
      this.nickname = "",
      this.icon = "",
      this.birthday,
      final List<Anniversary> anniversaries = const [],
      final List<Contact> contacts = const []})
      : _anniversaries = anniversaries,
        _contacts = contacts;

  @override
  final int? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey()
  final String icon;
  @override
  final DateTime? birthday;
  final List<Anniversary> _anniversaries;
  @override
  @JsonKey()
  List<Anniversary> get anniversaries {
    if (_anniversaries is EqualUnmodifiableListView) return _anniversaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anniversaries);
  }

  final List<Contact> _contacts;
  @override
  @JsonKey()
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'EditData(id: $id, name: $name, nickname: $nickname, icon: $icon, birthday: $birthday, anniversaries: $anniversaries, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditData &&
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
  _$$_EditDataCopyWith<_$_EditData> get copyWith =>
      __$$_EditDataCopyWithImpl<_$_EditData>(this, _$identity);
}

abstract class _EditData implements EditData {
  const factory _EditData(
      {final int? id,
      final String name,
      final String nickname,
      final String icon,
      final DateTime? birthday,
      final List<Anniversary> anniversaries,
      final List<Contact> contacts}) = _$_EditData;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get nickname;
  @override
  String get icon;
  @override
  DateTime? get birthday;
  @override
  List<Anniversary> get anniversaries;
  @override
  List<Contact> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_EditDataCopyWith<_$_EditData> get copyWith =>
      throw _privateConstructorUsedError;
}
