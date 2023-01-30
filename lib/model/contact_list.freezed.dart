// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactList {
  List<Contact> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactListCopyWith<ContactList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactListCopyWith<$Res> {
  factory $ContactListCopyWith(
          ContactList value, $Res Function(ContactList) then) =
      _$ContactListCopyWithImpl<$Res, ContactList>;
  @useResult
  $Res call({List<Contact> values});
}

/// @nodoc
class _$ContactListCopyWithImpl<$Res, $Val extends ContactList>
    implements $ContactListCopyWith<$Res> {
  _$ContactListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactListCopyWith<$Res>
    implements $ContactListCopyWith<$Res> {
  factory _$$_ContactListCopyWith(
          _$_ContactList value, $Res Function(_$_ContactList) then) =
      __$$_ContactListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Contact> values});
}

/// @nodoc
class __$$_ContactListCopyWithImpl<$Res>
    extends _$ContactListCopyWithImpl<$Res, _$_ContactList>
    implements _$$_ContactListCopyWith<$Res> {
  __$$_ContactListCopyWithImpl(
      _$_ContactList _value, $Res Function(_$_ContactList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$_ContactList(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
    ));
  }
}

/// @nodoc

class _$_ContactList implements _ContactList {
  const _$_ContactList({final List<Contact> values = const []})
      : _values = values;

  final List<Contact> _values;
  @override
  @JsonKey()
  List<Contact> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'ContactList(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactList &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactListCopyWith<_$_ContactList> get copyWith =>
      __$$_ContactListCopyWithImpl<_$_ContactList>(this, _$identity);
}

abstract class _ContactList implements ContactList {
  const factory _ContactList({final List<Contact> values}) = _$_ContactList;

  @override
  List<Contact> get values;
  @override
  @JsonKey(ignore: true)
  _$$_ContactListCopyWith<_$_ContactList> get copyWith =>
      throw _privateConstructorUsedError;
}
