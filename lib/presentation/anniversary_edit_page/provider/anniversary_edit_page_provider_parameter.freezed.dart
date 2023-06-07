// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_edit_page_provider_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryEditPageProviderParameter {
  Person get person => throw _privateConstructorUsedError;
  Anniversary get anniversary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryEditPageProviderParameterCopyWith<
          AnniversaryEditPageProviderParameter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryEditPageProviderParameterCopyWith<$Res> {
  factory $AnniversaryEditPageProviderParameterCopyWith(
          AnniversaryEditPageProviderParameter value,
          $Res Function(AnniversaryEditPageProviderParameter) then) =
      _$AnniversaryEditPageProviderParameterCopyWithImpl<$Res,
          AnniversaryEditPageProviderParameter>;
  @useResult
  $Res call({Person person, Anniversary anniversary});

  $PersonCopyWith<$Res> get person;
  $AnniversaryCopyWith<$Res> get anniversary;
}

/// @nodoc
class _$AnniversaryEditPageProviderParameterCopyWithImpl<$Res,
        $Val extends AnniversaryEditPageProviderParameter>
    implements $AnniversaryEditPageProviderParameterCopyWith<$Res> {
  _$AnniversaryEditPageProviderParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? anniversary = null,
  }) {
    return _then(_value.copyWith(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      anniversary: null == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as Anniversary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get person {
    return $PersonCopyWith<$Res>(_value.person, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnniversaryCopyWith<$Res> get anniversary {
    return $AnniversaryCopyWith<$Res>(_value.anniversary, (value) {
      return _then(_value.copyWith(anniversary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnniversaryEditPageProviderParameterCopyWith<$Res>
    implements $AnniversaryEditPageProviderParameterCopyWith<$Res> {
  factory _$$_AnniversaryEditPageProviderParameterCopyWith(
          _$_AnniversaryEditPageProviderParameter value,
          $Res Function(_$_AnniversaryEditPageProviderParameter) then) =
      __$$_AnniversaryEditPageProviderParameterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Person person, Anniversary anniversary});

  @override
  $PersonCopyWith<$Res> get person;
  @override
  $AnniversaryCopyWith<$Res> get anniversary;
}

/// @nodoc
class __$$_AnniversaryEditPageProviderParameterCopyWithImpl<$Res>
    extends _$AnniversaryEditPageProviderParameterCopyWithImpl<$Res,
        _$_AnniversaryEditPageProviderParameter>
    implements _$$_AnniversaryEditPageProviderParameterCopyWith<$Res> {
  __$$_AnniversaryEditPageProviderParameterCopyWithImpl(
      _$_AnniversaryEditPageProviderParameter _value,
      $Res Function(_$_AnniversaryEditPageProviderParameter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? anniversary = null,
  }) {
    return _then(_$_AnniversaryEditPageProviderParameter(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      anniversary: null == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as Anniversary,
    ));
  }
}

/// @nodoc

class _$_AnniversaryEditPageProviderParameter
    implements _AnniversaryEditPageProviderParameter {
  const _$_AnniversaryEditPageProviderParameter(
      {required this.person, required this.anniversary});

  @override
  final Person person;
  @override
  final Anniversary anniversary;

  @override
  String toString() {
    return 'AnniversaryEditPageProviderParameter(person: $person, anniversary: $anniversary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryEditPageProviderParameter &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, anniversary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryEditPageProviderParameterCopyWith<
          _$_AnniversaryEditPageProviderParameter>
      get copyWith => __$$_AnniversaryEditPageProviderParameterCopyWithImpl<
          _$_AnniversaryEditPageProviderParameter>(this, _$identity);
}

abstract class _AnniversaryEditPageProviderParameter
    implements AnniversaryEditPageProviderParameter {
  const factory _AnniversaryEditPageProviderParameter(
          {required final Person person,
          required final Anniversary anniversary}) =
      _$_AnniversaryEditPageProviderParameter;

  @override
  Person get person;
  @override
  Anniversary get anniversary;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryEditPageProviderParameterCopyWith<
          _$_AnniversaryEditPageProviderParameter>
      get copyWith => throw _privateConstructorUsedError;
}
