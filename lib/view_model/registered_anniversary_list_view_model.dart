import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/dialog/anniversary_form_dialog.dart';
import 'package:friend_list/component/dialog/confirm_dialog.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/model/ragistered_anniversary_list.dart';

final registeredAnniversaryListProvider = ChangeNotifierProvider
    .autoDispose<RegisteredAnniversaryListViewModel>((ref) =>
        RegisteredAnniversaryListViewModel(const RegisteredAnniversaryList()));

class RegisteredAnniversaryListViewModel extends ChangeNotifier {
  RegisteredAnniversaryList _model;

  RegisteredAnniversaryListViewModel(this._model);

  Anniversary? get birthday => _model.birthday;
  Iterable<Anniversary> get anniversaries => _model.customs;

  void updateBirthday(DateTime? value) {
    if (value == null) {
      return;
    }
    _model =
        _model.copyWith(birthday: Anniversary(name: "birthday", date: value));
    notifyListeners();
  }

  Future<void> addAnniversary(BuildContext context) async {
    final json = await AnniversaryFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newAnniversary = Anniversary(name: json["name"], date: json["date"]);
    _model = _model.copyWith(
      customs: [
        ..._model.customs,
        newAnniversary,
      ],
    );
    notifyListeners();
  }

  Future<void> deleteAnniversary(
      BuildContext context, Anniversary anniversary) async {
    final isAccept = await ConfirmDialog(
            "Confirm", "Do you want to delete the ${anniversary.name} ?")
        .show(context);
    if (isAccept) {
      final currentAnniversaries = List<Anniversary>.from(_model.customs);
      currentAnniversaries.remove(anniversary);
      _model = _model.copyWith(
        customs: currentAnniversaries,
      );
      notifyListeners();
    }
  }
}
