// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ragistered_anniversary_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisteredAnniversaryList {
  Anniversary? get birthday => throw _privateConstructorUsedError;
  List<Anniversary> get customs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisteredAnniversaryListCopyWith<RegisteredAnniversaryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredAnniversaryListCopyWith<$Res> {
  factory $RegisteredAnniversaryListCopyWith(RegisteredAnniversaryList value,
          $Res Function(RegisteredAnniversaryList) then) =
      _$RegisteredAnniversaryListCopyWithImpl<$Res, RegisteredAnniversaryList>;
  @useResult
  $Res call({Anniversary? birthday, List<Anniversary> customs});

  $AnniversaryCopyWith<$Res>? get birthday;
}

/// @nodoc
class _$RegisteredAnniversaryListCopyWithImpl<$Res,
        $Val extends RegisteredAnniversaryList>
    implements $RegisteredAnniversaryListCopyWith<$Res> {
  _$RegisteredAnniversaryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? customs = null,
  }) {
    return _then(_value.copyWith(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as Anniversary?,
      customs: null == customs
          ? _value.customs
          : customs // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnniversaryCopyWith<$Res>? get birthday {
    if (_value.birthday == null) {
      return null;
    }

    return $AnniversaryCopyWith<$Res>(_value.birthday!, (value) {
      return _then(_value.copyWith(birthday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RegisteredAnniversaryListCopyWith<$Res>
    implements $RegisteredAnniversaryListCopyWith<$Res> {
  factory _$$_RegisteredAnniversaryListCopyWith(
          _$_RegisteredAnniversaryList value,
          $Res Function(_$_RegisteredAnniversaryList) then) =
      __$$_RegisteredAnniversaryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Anniversary? birthday, List<Anniversary> customs});

  @override
  $AnniversaryCopyWith<$Res>? get birthday;
}

/// @nodoc
class __$$_RegisteredAnniversaryListCopyWithImpl<$Res>
    extends _$RegisteredAnniversaryListCopyWithImpl<$Res,
        _$_RegisteredAnniversaryList>
    implements _$$_RegisteredAnniversaryListCopyWith<$Res> {
  __$$_RegisteredAnniversaryListCopyWithImpl(
      _$_RegisteredAnniversaryList _value,
      $Res Function(_$_RegisteredAnniversaryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? customs = null,
  }) {
    return _then(_$_RegisteredAnniversaryList(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as Anniversary?,
      customs: null == customs
          ? _value._customs
          : customs // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ));
  }
}

/// @nodoc

class _$_RegisteredAnniversaryList implements _RegisteredAnniversaryList {
  const _$_RegisteredAnniversaryList(
      {this.birthday, final List<Anniversary> customs = const []})
      : _customs = customs;

  @override
  final Anniversary? birthday;
  final List<Anniversary> _customs;
  @override
  @JsonKey()
  List<Anniversary> get customs {
    if (_customs is EqualUnmodifiableListView) return _customs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customs);
  }

  @override
  String toString() {
    return 'RegisteredAnniversaryList(birthday: $birthday, customs: $customs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisteredAnniversaryList &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            const DeepCollectionEquality().equals(other._customs, _customs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, birthday, const DeepCollectionEquality().hash(_customs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisteredAnniversaryListCopyWith<_$_RegisteredAnniversaryList>
      get copyWith => __$$_RegisteredAnniversaryListCopyWithImpl<
          _$_RegisteredAnniversaryList>(this, _$identity);
}

abstract class _RegisteredAnniversaryList implements RegisteredAnniversaryList {
  const factory _RegisteredAnniversaryList(
      {final Anniversary? birthday,
      final List<Anniversary> customs}) = _$_RegisteredAnniversaryList;

  @override
  Anniversary? get birthday;
  @override
  List<Anniversary> get customs;
  @override
  @JsonKey(ignore: true)
  _$$_RegisteredAnniversaryListCopyWith<_$_RegisteredAnniversaryList>
      get copyWith => throw _privateConstructorUsedError;
}
