import 'package:freezed_annotation/freezed_annotation.dart';

part 'char_item.freezed.dart';
part 'char_item.g.dart';

@freezed
class CharItem with _$CharItem {
  const factory CharItem({
    required String nickname,
    required String imUserId,
  }) = _CharItem;

  factory CharItem.fromJson(Map<String, dynamic> json) =>
      _$CharItemFromJson(json);
}
