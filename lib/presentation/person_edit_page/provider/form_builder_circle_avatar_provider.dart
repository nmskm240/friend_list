import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_edit_page/notifier/form_builder_circle_avatar_notifyer.dart';

final formBuilderCircleAvatarProvider =
    StateNotifierProvider.family.autoDispose<FormBuilderCircleAvatarNotifier, Uint8List, Uint8List>((ref, initialValue) {
  return FormBuilderCircleAvatarNotifier(initialValue);
});
