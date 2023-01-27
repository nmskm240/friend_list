// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registered_contact_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisteredContactList {
  List<Contact> get contacts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisteredContactListCopyWith<RegisteredContactList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredContactListCopyWith<$Res> {
  factory $RegisteredContactListCopyWith(RegisteredContactList value,
          $Res Function(RegisteredContactList) then) =
      _$RegisteredContactListCopyWithImpl<$Res, RegisteredContactList>;
  @useResult
  $Res call({List<Contact> contacts});
}

/// @nodoc
class _$RegisteredContactListCopyWithImpl<$Res,
        $Val extends RegisteredContactList>
    implements $RegisteredContactListCopyWith<$Res> {
  _$RegisteredContactListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisteredContactListCopyWith<$Res>
    implements $RegisteredContactListCopyWith<$Res> {
  factory _$$_RegisteredContactListCopyWith(_$_RegisteredContactList value,
          $Res Function(_$_RegisteredContactList) then) =
      __$$_RegisteredContactListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Contact> contacts});
}

/// @nodoc
class __$$_RegisteredContactListCopyWithImpl<$Res>
    extends _$RegisteredContactListCopyWithImpl<$Res, _$_RegisteredContactList>
    implements _$$_RegisteredContactListCopyWith<$Res> {
  __$$_RegisteredContactListCopyWithImpl(_$_RegisteredContactList _value,
      $Res Function(_$_RegisteredContactList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_$_RegisteredContactList(
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc

class _$_RegisteredContactList implements _RegisteredContactList {
  const _$_RegisteredContactList({final List<Contact> contacts = const []})
      : _contacts = contacts;

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
    return 'RegisteredContactList(contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisteredContactList &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisteredContactListCopyWith<_$_RegisteredContactList> get copyWith =>
      __$$_RegisteredContactListCopyWithImpl<_$_RegisteredContactList>(
          this, _$identity);
}

abstract class _RegisteredContactList implements RegisteredContactList {
  const factory _RegisteredContactList({final List<Contact> contacts}) =
      _$_RegisteredContactList;

  @override
  List<Contact> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$_RegisteredContactListCopyWith<_$_RegisteredContactList> get copyWith =>
      throw _privateConstructorUsedError;
}
