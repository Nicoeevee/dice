// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogItemImpl _$$LogItemImplFromJson(Map<String, dynamic> json) =>
    _$LogItemImpl(
      character: CharItem.fromJson(json['character'] as Map<String, dynamic>),
      timeText: json['timeText'] as String,
      message: json['message'] as String,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$LogItemImplToJson(_$LogItemImpl instance) =>
    <String, dynamic>{
      'character': instance.character,
      'timeText': instance.timeText,
      'message': instance.message,
      'time': instance.time?.toIso8601String(),
    };
