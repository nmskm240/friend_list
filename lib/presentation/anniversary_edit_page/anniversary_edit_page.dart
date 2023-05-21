import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/presentation/anniversary_edit_page/widget/form_builder_drum_roll_date_picker.dart';

@RoutePage()
class AnniversaryEditPage extends ConsumerWidget {
  @protected
  final Person person;
  @protected
  final Anniversary anniversary;

  AnniversaryEditPage({
    super.key,
    required this.person,
    Anniversary? anniversary,
  }) : anniversary = anniversary ?? AnniversaryFactory().create(person.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (key.currentState!.validate()) {
                final fields = key.currentState!.instantValue;
                final factory = AnniversaryFactory();
                final res = factory.create(
                  person.id,
                  name: fields[Strings.formFieldName],
                  date: fields[Strings.formFieldDate],
                );
                Navigator.of(context).pop(res);
              }
            },
          )
        ],
      ),
      body: FormBuilder(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              FormBuilderTextField(
                name: Strings.formFieldName,
                initialValue: anniversary.name,
                enabled: !anniversary.isBirthdate,
                decoration: const InputDecoration(
                  label: Text(Strings.anniversaryEditPageFormNameLabel),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  (val) {
                    // required指定のためここではnullを返す
                    if (val == null || val.isEmpty) return null;
                    // 同名の記念日が存在しないか(編集前の要素は対象外)
                    if (person.hasSameAnniversaryByName(val) &&
                        val != anniversary.name) {
                      return Strings.duplicateAnniversary;
                    }
                    return null;
                  },
                ]),
              ),
              FormBuilderDrumRollDatePicker(
                name: Strings.formFieldDate,
                initalValue: anniversary.date,
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
