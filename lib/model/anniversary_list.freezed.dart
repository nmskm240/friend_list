// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryList {
  DateTime? get birthdate => throw _privateConstructorUsedError;
  List<Anniversary> get others => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryListCopyWith<AnniversaryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryListCopyWith<$Res> {
  factory $AnniversaryListCopyWith(
          AnniversaryList value, $Res Function(AnniversaryList) then) =
      _$AnniversaryListCopyWithImpl<$Res, AnniversaryList>;
  @useResult
  $Res call({DateTime? birthdate, List<Anniversary> others});
}

/// @nodoc
class _$AnniversaryListCopyWithImpl<$Res, $Val extends AnniversaryList>
    implements $AnniversaryListCopyWith<$Res> {
  _$AnniversaryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? others = null,
  }) {
    return _then(_value.copyWith(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnniversaryListCopyWith<$Res>
    implements $AnniversaryListCopyWith<$Res> {
  factory _$$_AnniversaryListCopyWith(
          _$_AnniversaryList value, $Res Function(_$_AnniversaryList) then) =
      __$$_AnniversaryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? birthdate, List<Anniversary> others});
}

/// @nodoc
class __$$_AnniversaryListCopyWithImpl<$Res>
    extends _$AnniversaryListCopyWithImpl<$Res, _$_AnniversaryList>
    implements _$$_AnniversaryListCopyWith<$Res> {
  __$$_AnniversaryListCopyWithImpl(
      _$_AnniversaryList _value, $Res Function(_$_AnniversaryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthdate = freezed,
    Object? others = null,
  }) {
    return _then(_$_AnniversaryList(
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      others: null == others
          ? _value._others
          : others // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ));
  }
}

/// @nodoc

class _$_AnniversaryList extends _AnniversaryList {
  const _$_AnniversaryList(
      {this.birthdate, final List<Anniversary> others = const []})
      : _others = others,
        super._();

  @override
  final DateTime? birthdate;
  final List<Anniversary> _others;
  @override
  @JsonKey()
  List<Anniversary> get others {
    if (_others is EqualUnmodifiableListView) return _others;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_others);
  }

  @override
  String toString() {
    return 'AnniversaryList(birthdate: $birthdate, others: $others)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryList &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            const DeepCollectionEquality().equals(other._others, _others));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, birthdate, const DeepCollectionEquality().hash(_others));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryListCopyWith<_$_AnniversaryList> get copyWith =>
      __$$_AnniversaryListCopyWithImpl<_$_AnniversaryList>(this, _$identity);
}

abstract class _AnniversaryList extends AnniversaryList {
  const factory _AnniversaryList(
      {final DateTime? birthdate,
      final List<Anniversary> others}) = _$_AnniversaryList;
  const _AnniversaryList._() : super._();

  @override
  DateTime? get birthdate;
  @override
  List<Anniversary> get others;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryListCopyWith<_$_AnniversaryList> get copyWith =>
      throw _privateConstructorUsedError;
}
