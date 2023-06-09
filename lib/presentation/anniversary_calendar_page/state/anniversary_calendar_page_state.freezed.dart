// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_calendar_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryCalendarPageState {
  CalendarFormat get format => throw _privateConstructorUsedError;
  DateTime get focusedDay => throw _privateConstructorUsedError;
  DateTime? get selectedDay => throw _privateConstructorUsedError;
  @protected
  List<Anniversary> get thisYearAnniversaries =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryCalendarPageStateCopyWith<AnniversaryCalendarPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryCalendarPageStateCopyWith<$Res> {
  factory $AnniversaryCalendarPageStateCopyWith(
          AnniversaryCalendarPageState value,
          $Res Function(AnniversaryCalendarPageState) then) =
      _$AnniversaryCalendarPageStateCopyWithImpl<$Res,
          AnniversaryCalendarPageState>;
  @useResult
  $Res call(
      {CalendarFormat format,
      DateTime focusedDay,
      DateTime? selectedDay,
      @protected List<Anniversary> thisYearAnniversaries});
}

/// @nodoc
class _$AnniversaryCalendarPageStateCopyWithImpl<$Res,
        $Val extends AnniversaryCalendarPageState>
    implements $AnniversaryCalendarPageStateCopyWith<$Res> {
  _$AnniversaryCalendarPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? focusedDay = null,
    Object? selectedDay = freezed,
    Object? thisYearAnniversaries = null,
  }) {
    return _then(_value.copyWith(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thisYearAnniversaries: null == thisYearAnniversaries
          ? _value.thisYearAnniversaries
          : thisYearAnniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnniversaryCalendarPageStateCopyWith<$Res>
    implements $AnniversaryCalendarPageStateCopyWith<$Res> {
  factory _$$_AnniversaryCalendarPageStateCopyWith(
          _$_AnniversaryCalendarPageState value,
          $Res Function(_$_AnniversaryCalendarPageState) then) =
      __$$_AnniversaryCalendarPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CalendarFormat format,
      DateTime focusedDay,
      DateTime? selectedDay,
      @protected List<Anniversary> thisYearAnniversaries});
}

/// @nodoc
class __$$_AnniversaryCalendarPageStateCopyWithImpl<$Res>
    extends _$AnniversaryCalendarPageStateCopyWithImpl<$Res,
        _$_AnniversaryCalendarPageState>
    implements _$$_AnniversaryCalendarPageStateCopyWith<$Res> {
  __$$_AnniversaryCalendarPageStateCopyWithImpl(
      _$_AnniversaryCalendarPageState _value,
      $Res Function(_$_AnniversaryCalendarPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? focusedDay = null,
    Object? selectedDay = freezed,
    Object? thisYearAnniversaries = null,
  }) {
    return _then(_$_AnniversaryCalendarPageState(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: freezed == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      thisYearAnniversaries: null == thisYearAnniversaries
          ? _value._thisYearAnniversaries
          : thisYearAnniversaries // ignore: cast_nullable_to_non_nullable
              as List<Anniversary>,
    ));
  }
}

/// @nodoc

class _$_AnniversaryCalendarPageState extends _AnniversaryCalendarPageState {
  const _$_AnniversaryCalendarPageState(
      {required this.format,
      required this.focusedDay,
      this.selectedDay,
      @protected final List<Anniversary> thisYearAnniversaries =
          const <Anniversary>[]})
      : _thisYearAnniversaries = thisYearAnniversaries,
        super._();

  @override
  final CalendarFormat format;
  @override
  final DateTime focusedDay;
  @override
  final DateTime? selectedDay;
  final List<Anniversary> _thisYearAnniversaries;
  @override
  @JsonKey()
  @protected
  List<Anniversary> get thisYearAnniversaries {
    if (_thisYearAnniversaries is EqualUnmodifiableListView)
      return _thisYearAnniversaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisYearAnniversaries);
  }

  @override
  String toString() {
    return 'AnniversaryCalendarPageState(format: $format, focusedDay: $focusedDay, selectedDay: $selectedDay, thisYearAnniversaries: $thisYearAnniversaries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryCalendarPageState &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality()
                .equals(other._thisYearAnniversaries, _thisYearAnniversaries));
  }

  @override
  int get hashCode => Object.hash(runtimeType, format, focusedDay, selectedDay,
      const DeepCollectionEquality().hash(_thisYearAnniversaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryCalendarPageStateCopyWith<_$_AnniversaryCalendarPageState>
      get copyWith => __$$_AnniversaryCalendarPageStateCopyWithImpl<
          _$_AnniversaryCalendarPageState>(this, _$identity);
}

abstract class _AnniversaryCalendarPageState
    extends AnniversaryCalendarPageState {
  const factory _AnniversaryCalendarPageState(
          {required final CalendarFormat format,
          required final DateTime focusedDay,
          final DateTime? selectedDay,
          @protected final List<Anniversary> thisYearAnniversaries}) =
      _$_AnniversaryCalendarPageState;
  const _AnniversaryCalendarPageState._() : super._();

  @override
  CalendarFormat get format;
  @override
  DateTime get focusedDay;
  @override
  DateTime? get selectedDay;
  @override
  @protected
  List<Anniversary> get thisYearAnniversaries;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryCalendarPageStateCopyWith<_$_AnniversaryCalendarPageState>
      get copyWith => throw _privateConstructorUsedError;
}
