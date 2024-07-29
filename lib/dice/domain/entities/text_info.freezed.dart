// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextInfo _$TextInfoFromJson(Map<String, dynamic> json) {
  return _TextInfo.fromJson(json);
}

/// @nodoc
mixin _$TextInfo {
  List<LogItem> get items => throw _privateConstructorUsedError;
  Map<String, CharItem> get charInfo => throw _privateConstructorUsedError;
  String get startText => throw _privateConstructorUsedError;
  String get exporter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextInfoCopyWith<TextInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextInfoCopyWith<$Res> {
  factory $TextInfoCopyWith(TextInfo value, $Res Function(TextInfo) then) =
      _$TextInfoCopyWithImpl<$Res, TextInfo>;
  @useResult
  $Res call(
      {List<LogItem> items,
      Map<String, CharItem> charInfo,
      String startText,
      String exporter});
}

/// @nodoc
class _$TextInfoCopyWithImpl<$Res, $Val extends TextInfo>
    implements $TextInfoCopyWith<$Res> {
  _$TextInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? charInfo = null,
    Object? startText = null,
    Object? exporter = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LogItem>,
      charInfo: null == charInfo
          ? _value.charInfo
          : charInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, CharItem>,
      startText: null == startText
          ? _value.startText
          : startText // ignore: cast_nullable_to_non_nullable
              as String,
      exporter: null == exporter
          ? _value.exporter
          : exporter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextInfoImplCopyWith<$Res>
    implements $TextInfoCopyWith<$Res> {
  factory _$$TextInfoImplCopyWith(
          _$TextInfoImpl value, $Res Function(_$TextInfoImpl) then) =
      __$$TextInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LogItem> items,
      Map<String, CharItem> charInfo,
      String startText,
      String exporter});
}

/// @nodoc
class __$$TextInfoImplCopyWithImpl<$Res>
    extends _$TextInfoCopyWithImpl<$Res, _$TextInfoImpl>
    implements _$$TextInfoImplCopyWith<$Res> {
  __$$TextInfoImplCopyWithImpl(
      _$TextInfoImpl _value, $Res Function(_$TextInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? charInfo = null,
    Object? startText = null,
    Object? exporter = null,
  }) {
    return _then(_$TextInfoImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<LogItem>,
      charInfo: null == charInfo
          ? _value._charInfo
          : charInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, CharItem>,
      startText: null == startText
          ? _value.startText
          : startText // ignore: cast_nullable_to_non_nullable
              as String,
      exporter: null == exporter
          ? _value.exporter
          : exporter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextInfoImpl implements _TextInfo {
  const _$TextInfoImpl(
      {required final List<LogItem> items,
      required final Map<String, CharItem> charInfo,
      required this.startText,
      required this.exporter})
      : _items = items,
        _charInfo = charInfo;

  factory _$TextInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextInfoImplFromJson(json);

  final List<LogItem> _items;
  @override
  List<LogItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final Map<String, CharItem> _charInfo;
  @override
  Map<String, CharItem> get charInfo {
    if (_charInfo is EqualUnmodifiableMapView) return _charInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_charInfo);
  }

  @override
  final String startText;
  @override
  final String exporter;

  @override
  String toString() {
    return 'TextInfo(items: $items, charInfo: $charInfo, startText: $startText, exporter: $exporter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextInfoImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._charInfo, _charInfo) &&
            (identical(other.startText, startText) ||
                other.startText == startText) &&
            (identical(other.exporter, exporter) ||
                other.exporter == exporter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_charInfo),
      startText,
      exporter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextInfoImplCopyWith<_$TextInfoImpl> get copyWith =>
      __$$TextInfoImplCopyWithImpl<_$TextInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextInfoImplToJson(
      this,
    );
  }
}

abstract class _TextInfo implements TextInfo {
  const factory _TextInfo(
      {required final List<LogItem> items,
      required final Map<String, CharItem> charInfo,
      required final String startText,
      required final String exporter}) = _$TextInfoImpl;

  factory _TextInfo.fromJson(Map<String, dynamic> json) =
      _$TextInfoImpl.fromJson;

  @override
  List<LogItem> get items;
  @override
  Map<String, CharItem> get charInfo;
  @override
  String get startText;
  @override
  String get exporter;
  @override
  @JsonKey(ignore: true)
  _$$TextInfoImplCopyWith<_$TextInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
