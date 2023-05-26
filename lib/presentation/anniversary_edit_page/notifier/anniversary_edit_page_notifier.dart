import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/anniversary_edit_page/state/anniversary_edit_page_state.dart';
import 'package:friend_list/presentation/app_router.dart';

class AnniversaryEditPageNotifier
    extends StateNotifier<AnniversaryEditPageState> {
  @protected
  Ref ref;

  AnniversaryEditPageNotifier(this.ref, Person person, Anniversary anniversary)
      : super(AnniversaryEditPageState(
          person: person,
          anniversary: anniversary,
          key: GlobalKey<FormBuilderState>(),
        ));

  Future<void> onPressedSave() async {
    if (state.validate()) {
      final res = state.save();
      ref.read(router).pop<Anniversary>(res);
    }
  }
}
