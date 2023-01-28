import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend_edit_form_state.dart';
import 'package:friend_list/view_model/friend_edit_page_view_model.dart';

final friendEditProvider = StateNotifierProvider.autoDispose<
    FriendEditPageViewModel,
    FriendEditFormState>((ref) => FriendEditPageViewModel());
