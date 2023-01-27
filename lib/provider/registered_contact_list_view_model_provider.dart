import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/registered_contact_list.dart';
import 'package:friend_list/view_model/registered_contact_list_view_model.dart';

final registeredContactListProvider =
    ChangeNotifierProvider.autoDispose<RegisteredContactListViewModel>(
        (ref) => RegisteredContactListViewModel(const RegisteredContactList()));
