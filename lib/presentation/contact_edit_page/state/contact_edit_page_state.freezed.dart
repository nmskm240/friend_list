// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_edit_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContactEditPageState {
  @protected
  Person get person => throw _privateConstructorUsedError;
  @protected
  Contact get contact => throw _privateConstructorUsedError;
  @protected
  GlobalKey<FormBuilderState> get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactEditPageStateCopyWith<ContactEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactEditPageStateCopyWith<$Res> {
  factory $ContactEditPageStateCopyWith(ContactEditPageState value,
          $Res Function(ContactEditPageState) then) =
      _$ContactEditPageStateCopyWithImpl<$Res, ContactEditPageState>;
  @useResult
  $Res call(
      {@protected Person person,
      @protected Contact contact,
      @protected GlobalKey<FormBuilderState> key});
}

/// @nodoc
class _$ContactEditPageStateCopyWithImpl<$Res,
        $Val extends ContactEditPageState>
    implements $ContactEditPageStateCopyWith<$Res> {
  _$ContactEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? contact = null,
    Object? key = null,
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
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactEditPageStateCopyWith<$Res>
    implements $ContactEditPageStateCopyWith<$Res> {
  factory _$$_ContactEditPageStateCopyWith(_$_ContactEditPageState value,
          $Res Function(_$_ContactEditPageState) then) =
      __$$_ContactEditPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@protected Person person,
      @protected Contact contact,
      @protected GlobalKey<FormBuilderState> key});
}

/// @nodoc
class __$$_ContactEditPageStateCopyWithImpl<$Res>
    extends _$ContactEditPageStateCopyWithImpl<$Res, _$_ContactEditPageState>
    implements _$$_ContactEditPageStateCopyWith<$Res> {
  __$$_ContactEditPageStateCopyWithImpl(_$_ContactEditPageState _value,
      $Res Function(_$_ContactEditPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? contact = null,
    Object? key = null,
  }) {
    return _then(_$_ContactEditPageState(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormBuilderState>,
    ));
  }
}

/// @nodoc

class _$_ContactEditPageState extends _ContactEditPageState {
  const _$_ContactEditPageState(
      {@protected required this.person,
      @protected required this.contact,
      @protected required this.key})
      : super._();

  @override
  @protected
  final Person person;
  @override
  @protected
  final Contact contact;
  @override
  @protected
  final GlobalKey<FormBuilderState> key;

  @override
  String toString() {
    return 'ContactEditPageState(person: $person, contact: $contact, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactEditPageState &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, contact, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactEditPageStateCopyWith<_$_ContactEditPageState> get copyWith =>
      __$$_ContactEditPageStateCopyWithImpl<_$_ContactEditPageState>(
          this, _$identity);
}

abstract class _ContactEditPageState extends ContactEditPageState {
  const factory _ContactEditPageState(
          {@protected required final Person person,
          @protected required final Contact contact,
          @protected required final GlobalKey<FormBuilderState> key}) =
      _$_ContactEditPageState;
  const _ContactEditPageState._() : super._();

  @override
  @protected
  Person get person;
  @override
  @protected
  Contact get contact;
  @override
  @protected
  GlobalKey<FormBuilderState> get key;
  @override
  @JsonKey(ignore: true)
  _$$_ContactEditPageStateCopyWith<_$_ContactEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
