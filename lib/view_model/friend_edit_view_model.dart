import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/dialog/anniversary_form_dialog.dart';
import 'package:friend_list/component/dialog/confirm_dialog.dart';
import 'package:friend_list/component/dialog/contact_form_dialog.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/model/edit_data.dart';
import 'package:friend_list/repository/friend_repository_by_local_database.dart';

final friendEditViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => FriendEditViewModel());

class FriendEditViewModel extends ChangeNotifier {
  late EditData _model;

  FriendEditViewModel({EditData? model}) : super() {
    _model = model ?? const EditData();
  }

  String get name => _model.name;
  String get nickname => _model.nickname;
  String get icon => _model.icon;
  DateTime? get birthday => _model.birthday;
  List<Anniversary> get anniversaries => _model.anniversaries;
  List<Contact> get contacts => _model.contacts;

  onSaved() async {
    final repository = FriendRepositoryByLocalDatbase();
    final friend = Friend(
      name: name,
      nickname: nickname,
      icon: icon,
    );
    final saved = await repository.save(friend);
    final id = saved.id;
    //TODO: save process
  }

  void onChangedName(String name) {
    _model = _model.copyWith(name: name);
  }

  void onChangedNickname(String nickname) {
    _model = _model.copyWith(nickname: nickname);
  }

  void onChangedIcon(String base64) {
    _model = _model.copyWith(icon: base64);
  }

  void onChangedBirthday(DateTime date) {
    _model = _model.copyWith(birthday: date);
  }

  Future<void> createAnniversary(BuildContext context) async {
    final json = await AnniversaryFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newAnniversary = Anniversary(name: json["name"], date: json["date"]);
    _model = _model.copyWith(
      anniversaries: [
        ..._model.anniversaries,
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
      final anniversaries = List<Anniversary>.from(_model.anniversaries);
      anniversaries.remove(anniversary);
      _model = _model.copyWith(
        anniversaries: anniversaries,
      );
      notifyListeners();
    }
  }

  Future<void> createContact(BuildContext context) async {
    final json = await ContactFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newContact = Contact(method: json["method"], value: json["value"]);
    _model = _model.copyWith(
      contacts: [
        ..._model.contacts,
        newContact,
      ],
    );
    notifyListeners();
  }

  Future<void> deleteContact(BuildContext context, Contact contact) async {
    final isAccept = await ConfirmDialog(
            "Confirm", "Do you want to delete the ${contact.method.name} ?")
        .show(context);
    if (isAccept) {
      final contacts = List<Contact>.from(_model.contacts);
      contacts.remove(contact);
      _model = _model.copyWith(
        contacts: contacts,
      );
      notifyListeners();
    }
  }
}
