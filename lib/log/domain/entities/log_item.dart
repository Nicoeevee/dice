import 'package:dice/log/domain/entities/char_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_item.freezed.dart';
part 'log_item.g.dart';

@freezed
class LogItem with _$LogItem {
  const factory LogItem({
    required CharItem character,
    required String timeText,
    required String message,
    DateTime? time,
  }) = _LogItem;

  factory LogItem.fromJson(Map<String, dynamic> json) =>
      _$LogItemFromJson(json);
}
