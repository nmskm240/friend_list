// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anniversary_edit_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnniversaryEditSettings {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get canDelete => throw _privateConstructorUsedError;
  bool get canChangeName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnniversaryEditSettingsCopyWith<AnniversaryEditSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnniversaryEditSettingsCopyWith<$Res> {
  factory $AnniversaryEditSettingsCopyWith(AnniversaryEditSettings value,
          $Res Function(AnniversaryEditSettings) then) =
      _$AnniversaryEditSettingsCopyWithImpl<$Res, AnniversaryEditSettings>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime? date,
      bool canDelete,
      bool canChangeName});
}

/// @nodoc
class _$AnniversaryEditSettingsCopyWithImpl<$Res,
        $Val extends AnniversaryEditSettings>
    implements $AnniversaryEditSettingsCopyWith<$Res> {
  _$AnniversaryEditSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = freezed,
    Object? canDelete = null,
    Object? canChangeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      canChangeName: null == canChangeName
          ? _value.canChangeName
          : canChangeName // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnniversaryEditSettingsCopyWith<$Res>
    implements $AnniversaryEditSettingsCopyWith<$Res> {
  factory _$$_AnniversaryEditSettingsCopyWith(_$_AnniversaryEditSettings value,
          $Res Function(_$_AnniversaryEditSettings) then) =
      __$$_AnniversaryEditSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime? date,
      bool canDelete,
      bool canChangeName});
}

/// @nodoc
class __$$_AnniversaryEditSettingsCopyWithImpl<$Res>
    extends _$AnniversaryEditSettingsCopyWithImpl<$Res,
        _$_AnniversaryEditSettings>
    implements _$$_AnniversaryEditSettingsCopyWith<$Res> {
  __$$_AnniversaryEditSettingsCopyWithImpl(_$_AnniversaryEditSettings _value,
      $Res Function(_$_AnniversaryEditSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = freezed,
    Object? canDelete = null,
    Object? canChangeName = null,
  }) {
    return _then(_$_AnniversaryEditSettings(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canDelete: null == canDelete
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      canChangeName: null == canChangeName
          ? _value.canChangeName
          : canChangeName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AnniversaryEditSettings implements _AnniversaryEditSettings {
  const _$_AnniversaryEditSettings(
      {this.id = "",
      required this.name,
      this.date,
      this.canDelete = true,
      this.canChangeName = true});

  @override
  @JsonKey()
  final String id;
  @override
  final String name;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final bool canDelete;
  @override
  @JsonKey()
  final bool canChangeName;

  @override
  String toString() {
    return 'AnniversaryEditSettings(id: $id, name: $name, date: $date, canDelete: $canDelete, canChangeName: $canChangeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnniversaryEditSettings &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.canDelete, canDelete) ||
                other.canDelete == canDelete) &&
            (identical(other.canChangeName, canChangeName) ||
                other.canChangeName == canChangeName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, date, canDelete, canChangeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnniversaryEditSettingsCopyWith<_$_AnniversaryEditSettings>
      get copyWith =>
          __$$_AnniversaryEditSettingsCopyWithImpl<_$_AnniversaryEditSettings>(
              this, _$identity);
}

abstract class _AnniversaryEditSettings implements AnniversaryEditSettings {
  const factory _AnniversaryEditSettings(
      {final String id,
      required final String name,
      final DateTime? date,
      final bool canDelete,
      final bool canChangeName}) = _$_AnniversaryEditSettings;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime? get date;
  @override
  bool get canDelete;
  @override
  bool get canChangeName;
  @override
  @JsonKey(ignore: true)
  _$$_AnniversaryEditSettingsCopyWith<_$_AnniversaryEditSettings>
      get copyWith => throw _privateConstructorUsedError;
}
