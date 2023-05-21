import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 人物検索用（とりあえず名前とニックネームで検索できるようにString）
final personFileter = StateProvider.autoDispose<String>((ref) {
  return "";
});