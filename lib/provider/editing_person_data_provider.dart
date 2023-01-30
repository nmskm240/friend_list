import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/person_data_edit_form.dart';
import 'package:friend_list/view_model/person_edit_view_model.dart';

final editingPersonDataProvider =
    StateNotifierProvider.autoDispose<PersonEditViewModel, PersonDataEditForm>(
        (ref) => PersonEditViewModel());
