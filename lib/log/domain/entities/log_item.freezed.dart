// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogItem _$LogItemFromJson(Map<String, dynamic> json) {
  return _LogItem.fromJson(json);
}

/// @nodoc
mixin _$LogItem {
  CharItem get character => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  String get timeText => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogItemCopyWith<LogItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogItemCopyWith<$Res> {
  factory $LogItemCopyWith(LogItem value, $Res Function(LogItem) then) =
      _$LogItemCopyWithImpl<$Res, LogItem>;
  @useResult
  $Res call(
      {CharItem character, DateTime? time, String timeText, String message});

  $CharItemCopyWith<$Res> get character;
}

/// @nodoc
class _$LogItemCopyWithImpl<$Res, $Val extends LogItem>
    implements $LogItemCopyWith<$Res> {
  _$LogItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? time = freezed,
    Object? timeText = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as CharItem,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeText: null == timeText
          ? _value.timeText
          : timeText // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharItemCopyWith<$Res> get character {
    return $CharItemCopyWith<$Res>(_value.character, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LogItemImplCopyWith<$Res> implements $LogItemCopyWith<$Res> {
  factory _$$LogItemImplCopyWith(
          _$LogItemImpl value, $Res Function(_$LogItemImpl) then) =
      __$$LogItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CharItem character, DateTime? time, String timeText, String message});

  @override
  $CharItemCopyWith<$Res> get character;
}

/// @nodoc
class __$$LogItemImplCopyWithImpl<$Res>
    extends _$LogItemCopyWithImpl<$Res, _$LogItemImpl>
    implements _$$LogItemImplCopyWith<$Res> {
  __$$LogItemImplCopyWithImpl(
      _$LogItemImpl _value, $Res Function(_$LogItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? character = null,
    Object? time = freezed,
    Object? timeText = null,
    Object? message = null,
  }) {
    return _then(_$LogItemImpl(
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as CharItem,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeText: null == timeText
          ? _value.timeText
          : timeText // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogItemImpl implements _LogItem {
  const _$LogItemImpl(
      {required this.character,
      this.time,
      required this.timeText,
      required this.message});

  factory _$LogItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogItemImplFromJson(json);

  @override
  final CharItem character;
  @override
  final DateTime? time;
  @override
  final String timeText;
  @override
  final String message;

  @override
  String toString() {
    return 'LogItem(character: $character, time: $time, timeText: $timeText, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogItemImpl &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.timeText, timeText) ||
                other.timeText == timeText) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, character, time, timeText, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogItemImplCopyWith<_$LogItemImpl> get copyWith =>
      __$$LogItemImplCopyWithImpl<_$LogItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogItemImplToJson(
      this,
    );
  }
}

abstract class _LogItem implements LogItem {
  const factory _LogItem(
      {required final CharItem character,
      final DateTime? time,
      required final String timeText,
      required final String message}) = _$LogItemImpl;

  factory _LogItem.fromJson(Map<String, dynamic> json) = _$LogItemImpl.fromJson;

  @override
  CharItem get character;
  @override
  DateTime? get time;
  @override
  String get timeText;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$LogItemImplCopyWith<_$LogItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
