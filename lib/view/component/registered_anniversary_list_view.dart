import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/registered_anniversary_list_view_model.dart';

class RegisteredAnniversaryListView extends ConsumerWidget {
  final GlobalKey formKey;

  const RegisteredAnniversaryListView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(registeredAnniversaryListProvider);
    return FormBuilder(
      key: formKey,
      child: ListViewWithHeader.builder(
        context: context,
        title: "Anniversary",
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            await viewmodel.addAnniversary(context);
          },
        ),
        itemCount: viewmodel.anniversaries.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              title: FormBuilderDateTimePicker(
                name: 'birthday',
                initialValue: viewmodel.birthday?.date,
                inputType: InputType.date,
                onSaved: viewmodel.onSavedBirthday,
                decoration: const InputDecoration(
                  label: Text("Birthday"),
                ),
              ),
            );
          } else {
            final anniversary = viewmodel.anniversaries.elementAt(index - 1);
            return ListTile(
              title: FormBuilderDateTimePicker(
                name: anniversary.name,
                inputType: InputType.date,
                decoration: InputDecoration(
                  label: Text(anniversary.name),
                ),
                initialValue: anniversary.date,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await viewmodel.deleteAnniversary(context, anniversary);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
