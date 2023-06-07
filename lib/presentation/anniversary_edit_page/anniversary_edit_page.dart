import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/anniversary_edit_page/notifier/anniversary_edit_page_notifier.dart';
import 'package:friend_list/presentation/anniversary_edit_page/provider/anniversary_edit_page_provider.dart';
import 'package:friend_list/presentation/anniversary_edit_page/provider/anniversary_edit_page_provider_parameter.dart';
import 'package:friend_list/presentation/anniversary_edit_page/state/anniversary_edit_page_state.dart';
import 'package:friend_list/presentation/anniversary_edit_page/widget/form_builder_drum_roll_date_picker.dart';

@RoutePage<Anniversary>()
class AnniversaryEditPage extends ConsumerWidget {
  @protected
  final AutoDisposeStateNotifierProvider<AnniversaryEditPageNotifier,
      AnniversaryEditPageState> provider;

  AnniversaryEditPage({
    super.key,
    required Person person,
    required Anniversary anniversary,
  }) : provider = anniversaryeditPageProvider(
          AnniversaryEditPageProviderParameter(
            person: person,
            anniversary: anniversary,
          ),
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await notifier.onPressedSave();
            },
          )
        ],
      ),
      body: FormBuilder(
        key: state.formKey,
        initialValue: state.initialValue,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              FormBuilderTextField(
                name: state.formFieldName,
                enabled: state.isEditableName,
                decoration: const InputDecoration(
                  label: Text(Strings.anniversaryEditPageFormNameLabel),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  state.validateAnniversayName,
                ]),
              ),
              FormBuilderDrumRollDatePicker(
                name: state.formFieldDate,
                validator: FormBuilderValidators.required(),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
