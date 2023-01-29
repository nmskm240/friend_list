import 'package:flutter/material.dart';
import 'package:friend_list/component/dialog/anniversary_form_dialog.dart';
import 'package:friend_list/component/dialog/confirm_dialog.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/model/anniversary_list.dart';

class RegisteredAnniversaryListViewModel extends ChangeNotifier {
  AnniversaryList _model;

  RegisteredAnniversaryListViewModel(this._model);

  DateTime? get birthdate => _model.birthdate;
  Iterable<Anniversary> get anniversaries => _model.others;

  void onSavedBirthday(DateTime? value) {
    if (value == null) {
      return;
    }
    _model = _model.copyWith(birthdate: value);
  }

  Future<void> addAnniversary(BuildContext context) async {
    final json = await AnniversaryFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newAnniversary = Anniversary(name: json["name"], date: json["date"]);
    _model = _model.copyWith(
      others: [
        ..._model.others,
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
      final current = List<Anniversary>.from(_model.others);
      current.remove(anniversary);
      _model = _model.copyWith(
        others: current,
      );
      notifyListeners();
    }
  }
}
