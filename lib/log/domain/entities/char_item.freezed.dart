// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'char_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharItem _$CharItemFromJson(Map<String, dynamic> json) {
  return _CharItem.fromJson(json);
}

/// @nodoc
mixin _$CharItem {
  String get nickname => throw _privateConstructorUsedError;
  String get imUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharItemCopyWith<CharItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharItemCopyWith<$Res> {
  factory $CharItemCopyWith(CharItem value, $Res Function(CharItem) then) =
      _$CharItemCopyWithImpl<$Res, CharItem>;
  @useResult
  $Res call({String nickname, String imUserId});
}

/// @nodoc
class _$CharItemCopyWithImpl<$Res, $Val extends CharItem>
    implements $CharItemCopyWith<$Res> {
  _$CharItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? imUserId = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imUserId: null == imUserId
          ? _value.imUserId
          : imUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharItemImplCopyWith<$Res>
    implements $CharItemCopyWith<$Res> {
  factory _$$CharItemImplCopyWith(
          _$CharItemImpl value, $Res Function(_$CharItemImpl) then) =
      __$$CharItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, String imUserId});
}

/// @nodoc
class __$$CharItemImplCopyWithImpl<$Res>
    extends _$CharItemCopyWithImpl<$Res, _$CharItemImpl>
    implements _$$CharItemImplCopyWith<$Res> {
  __$$CharItemImplCopyWithImpl(
      _$CharItemImpl _value, $Res Function(_$CharItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? imUserId = null,
  }) {
    return _then(_$CharItemImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imUserId: null == imUserId
          ? _value.imUserId
          : imUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharItemImpl implements _CharItem {
  const _$CharItemImpl({required this.nickname, required this.imUserId});

  factory _$CharItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharItemImplFromJson(json);

  @override
  final String nickname;
  @override
  final String imUserId;

  @override
  String toString() {
    return 'CharItem(nickname: $nickname, imUserId: $imUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharItemImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.imUserId, imUserId) ||
                other.imUserId == imUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, imUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharItemImplCopyWith<_$CharItemImpl> get copyWith =>
      __$$CharItemImplCopyWithImpl<_$CharItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharItemImplToJson(
      this,
    );
  }
}

abstract class _CharItem implements CharItem {
  const factory _CharItem(
      {required final String nickname,
      required final String imUserId}) = _$CharItemImpl;

  factory _CharItem.fromJson(Map<String, dynamic> json) =
      _$CharItemImpl.fromJson;

  @override
  String get nickname;
  @override
  String get imUserId;
  @override
  @JsonKey(ignore: true)
  _$$CharItemImplCopyWith<_$CharItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
