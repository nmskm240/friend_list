import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend_basic_info.dart';
import 'package:friend_list/view_model/friend_basic_info_edit_view_model.dart';

final friendBasicInfoProvider = StateNotifierProvider.autoDispose<
    FriendBasicInfoViewModel,
    FriendBasicInfo>((ref) => FriendBasicInfoViewModel());
