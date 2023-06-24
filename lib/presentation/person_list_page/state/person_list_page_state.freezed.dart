// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonListPageState {
  Iterable<Person> get persons => throw _privateConstructorUsedError;
  bool get isFiltering => throw _privateConstructorUsedError;
  PersonSortOrder get sortOrder => throw _privateConstructorUsedError;
  TextEditingController get searchBarController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonListPageStateCopyWith<PersonListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonListPageStateCopyWith<$Res> {
  factory $PersonListPageStateCopyWith(
          PersonListPageState value, $Res Function(PersonListPageState) then) =
      _$PersonListPageStateCopyWithImpl<$Res, PersonListPageState>;
  @useResult
  $Res call(
      {Iterable<Person> persons,
      bool isFiltering,
      PersonSortOrder sortOrder,
      TextEditingController searchBarController});
}

/// @nodoc
class _$PersonListPageStateCopyWithImpl<$Res, $Val extends PersonListPageState>
    implements $PersonListPageStateCopyWith<$Res> {
  _$PersonListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persons = null,
    Object? isFiltering = null,
    Object? sortOrder = null,
    Object? searchBarController = null,
  }) {
    return _then(_value.copyWith(
      persons: null == persons
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as Iterable<Person>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as PersonSortOrder,
      searchBarController: null == searchBarController
          ? _value.searchBarController
          : searchBarController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonListPageStateCopyWith<$Res>
    implements $PersonListPageStateCopyWith<$Res> {
  factory _$$_PersonListPageStateCopyWith(_$_PersonListPageState value,
          $Res Function(_$_PersonListPageState) then) =
      __$$_PersonListPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Iterable<Person> persons,
      bool isFiltering,
      PersonSortOrder sortOrder,
      TextEditingController searchBarController});
}

/// @nodoc
class __$$_PersonListPageStateCopyWithImpl<$Res>
    extends _$PersonListPageStateCopyWithImpl<$Res, _$_PersonListPageState>
    implements _$$_PersonListPageStateCopyWith<$Res> {
  __$$_PersonListPageStateCopyWithImpl(_$_PersonListPageState _value,
      $Res Function(_$_PersonListPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persons = null,
    Object? isFiltering = null,
    Object? sortOrder = null,
    Object? searchBarController = null,
  }) {
    return _then(_$_PersonListPageState(
      persons: null == persons
          ? _value.persons
          : persons // ignore: cast_nullable_to_non_nullable
              as Iterable<Person>,
      isFiltering: null == isFiltering
          ? _value.isFiltering
          : isFiltering // ignore: cast_nullable_to_non_nullable
              as bool,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as PersonSortOrder,
      searchBarController: null == searchBarController
          ? _value.searchBarController
          : searchBarController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_PersonListPageState extends _PersonListPageState {
  const _$_PersonListPageState(
      {required this.persons,
      this.isFiltering = false,
      required this.sortOrder,
      required this.searchBarController})
      : super._();

  @override
  final Iterable<Person> persons;
  @override
  @JsonKey()
  final bool isFiltering;
  @override
  final PersonSortOrder sortOrder;
  @override
  final TextEditingController searchBarController;

  @override
  String toString() {
    return 'PersonListPageState(persons: $persons, isFiltering: $isFiltering, sortOrder: $sortOrder, searchBarController: $searchBarController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonListPageState &&
            const DeepCollectionEquality().equals(other.persons, persons) &&
            (identical(other.isFiltering, isFiltering) ||
                other.isFiltering == isFiltering) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.searchBarController, searchBarController) ||
                other.searchBarController == searchBarController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(persons),
      isFiltering,
      sortOrder,
      searchBarController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonListPageStateCopyWith<_$_PersonListPageState> get copyWith =>
      __$$_PersonListPageStateCopyWithImpl<_$_PersonListPageState>(
          this, _$identity);
}

abstract class _PersonListPageState extends PersonListPageState {
  const factory _PersonListPageState(
          {required final Iterable<Person> persons,
          final bool isFiltering,
          required final PersonSortOrder sortOrder,
          required final TextEditingController searchBarController}) =
      _$_PersonListPageState;
  const _PersonListPageState._() : super._();

  @override
  Iterable<Person> get persons;
  @override
  bool get isFiltering;
  @override
  PersonSortOrder get sortOrder;
  @override
  TextEditingController get searchBarController;
  @override
  @JsonKey(ignore: true)
  _$$_PersonListPageStateCopyWith<_$_PersonListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
