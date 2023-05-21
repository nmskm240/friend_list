import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterMode = StateProvider.autoDispose<bool>((ref) {
  return false;
});