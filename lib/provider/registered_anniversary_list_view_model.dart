import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/anniversary_list.dart';
import 'package:friend_list/view_model/registered_anniversary_list_view_model.dart';

final registeredAnniversaryListProvider = ChangeNotifierProvider
    .autoDispose<RegisteredAnniversaryListViewModel>((ref) =>
        RegisteredAnniversaryListViewModel(const AnniversaryList()));
