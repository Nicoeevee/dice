import 'package:dice/dice/domain/entities/char_item.dart';
import 'package:dice/dice/domain/entities/log_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_info.freezed.dart';
part 'text_info.g.dart';

@freezed
class TextInfo with _$TextInfo {
  const factory TextInfo({
    required List<LogItem> items,
    required Map<String, CharItem> charInfo,
    required String startText,
    required String exporter,
  }) = _TextInfo;

  factory TextInfo.fromJson(Map<String, dynamic> json) =>
      _$TextInfoFromJson(json);
}
