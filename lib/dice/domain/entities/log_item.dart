import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_item.freezed.dart';
part 'log_item.g.dart';

@freezed
class LogItem with _$LogItem {
  const factory LogItem({
    required String nickname,
    required String IMUserId,
    DateTime? time,
    required String timeText,
    required String message,
  }) = _LogItem;

  factory LogItem.fromJson(Map<String, dynamic> json) =>
      _$LogItemFromJson(json);
}
