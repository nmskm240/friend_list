// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_edit_page_provider_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactEditPageProviderParameter {
  Person get person => throw _privateConstructorUsedError;
  Contact get contact => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactEditPageProviderParameterCopyWith<ContactEditPageProviderParameter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEditPageProviderParameterCopyWith<$Res> {
  factory $ContactEditPageProviderParameterCopyWith(
          ContactEditPageProviderParameter value,
          $Res Function(ContactEditPageProviderParameter) then) =
      _$ContactEditPageProviderParameterCopyWithImpl<$Res,
          ContactEditPageProviderParameter>;
  @useResult
  $Res call({Person person, Contact contact});
}

/// @nodoc
class _$ContactEditPageProviderParameterCopyWithImpl<$Res,
        $Val extends ContactEditPageProviderParameter>
    implements $ContactEditPageProviderParameterCopyWith<$Res> {
  _$ContactEditPageProviderParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? contact = null,
  }) {
    return _then(_value.copyWith(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactEditPageProviderParameterCopyWith<$Res>
    implements $ContactEditPageProviderParameterCopyWith<$Res> {
  factory _$$_ContactEditPageProviderParameterCopyWith(
          _$_ContactEditPageProviderParameter value,
          $Res Function(_$_ContactEditPageProviderParameter) then) =
      __$$_ContactEditPageProviderParameterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Person person, Contact contact});
}

/// @nodoc
class __$$_ContactEditPageProviderParameterCopyWithImpl<$Res>
    extends _$ContactEditPageProviderParameterCopyWithImpl<$Res,
        _$_ContactEditPageProviderParameter>
    implements _$$_ContactEditPageProviderParameterCopyWith<$Res> {
  __$$_ContactEditPageProviderParameterCopyWithImpl(
      _$_ContactEditPageProviderParameter _value,
      $Res Function(_$_ContactEditPageProviderParameter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? contact = null,
  }) {
    return _then(_$_ContactEditPageProviderParameter(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
    ));
  }
}

/// @nodoc

class _$_ContactEditPageProviderParameter
    implements _ContactEditPageProviderParameter {
  const _$_ContactEditPageProviderParameter(
      {required this.person, required this.contact});

  @override
  final Person person;
  @override
  final Contact contact;

  @override
  String toString() {
    return 'ContactEditPageProviderParameter(person: $person, contact: $contact)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactEditPageProviderParameter &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactEditPageProviderParameterCopyWith<
          _$_ContactEditPageProviderParameter>
      get copyWith => __$$_ContactEditPageProviderParameterCopyWithImpl<
          _$_ContactEditPageProviderParameter>(this, _$identity);
}

abstract class _ContactEditPageProviderParameter
    implements ContactEditPageProviderParameter {
  const factory _ContactEditPageProviderParameter(
      {required final Person person,
      required final Contact contact}) = _$_ContactEditPageProviderParameter;

  @override
  Person get person;
  @override
  Contact get contact;
  @override
  @JsonKey(ignore: true)
  _$$_ContactEditPageProviderParameterCopyWith<
          _$_ContactEditPageProviderParameter>
      get copyWith => throw _privateConstructorUsedError;
}
