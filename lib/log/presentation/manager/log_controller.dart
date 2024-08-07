import 'package:flutter_riverpod/flutter_riverpod.dart';

final logStringStreamProvider = StreamProvider<String>((ref) {
  return const Stream.empty();
});
