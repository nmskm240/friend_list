import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/dialog/anniversary_form_dialog.dart';
import 'package:friend_list/component/dialog/confirm_dialog.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';

final friendEditViewModelProvider =
    ChangeNotifierProvider((ref) => FriendEditViewModel());

class FriendEditViewModel extends ChangeNotifier {
  final List<Anniversary> _anniversaries;
  final List<Contact> _contacts;

  Iterable<Anniversary> get anniversaries => _anniversaries;
  Iterable<Contact> get contact => _contacts;

  FriendEditViewModel({
    List<Anniversary>? anniversaries,
    List<Contact>? contacts,
  })  : _anniversaries = anniversaries ?? [],
        _contacts = contacts ?? [];

  Future<void> createAnniversary(BuildContext context) async {
    final json = await AnniversaryFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newAnniversary = Anniversary(name: json["name"], date: json["date"]);
    _anniversaries.add(newAnniversary);
    notifyListeners();
  }

  Future<void> deleteAnniversary(
      BuildContext context, Anniversary anniversary) async {
    final isAccept = await ConfirmDialog(
            "Confirm", "Do you want to delete the ${anniversary.name} ?")
        .show(context);
    if (isAccept) {
      _anniversaries.remove(anniversary);
      notifyListeners();
    }
  }
}
