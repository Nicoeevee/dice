// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextInfoImpl _$$TextInfoImplFromJson(Map<String, dynamic> json) =>
    _$TextInfoImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => LogItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      charInfo: (json['charInfo'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CharItem.fromJson(e as Map<String, dynamic>)),
      ),
      exporter: json['exporter'] as String,
      startText: json['startText'] as String?,
    );

Map<String, dynamic> _$$TextInfoImplToJson(_$TextInfoImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'charInfo': instance.charInfo,
      'exporter': instance.exporter,
      'startText': instance.startText,
    };
