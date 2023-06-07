import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_edit_page/provider/form_builder_circle_avatar_provider.dart';
import 'package:friend_list/presentation/person_edit_page/widget/image_pick_error_dialog.dart';

class FormBuilderCircleAvatar extends ConsumerWidget {
  final String name;
  final Uint8List initalValue;
  final void Function(Uint8List?)? onChanged;

  const FormBuilderCircleAvatar({
    super.key,
    required this.name,
    required this.initalValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier =
        ref.read(formBuilderCircleAvatarProvider(initalValue).notifier);
    final state = ref.watch(formBuilderCircleAvatarProvider(initalValue));
    return FormBuilderField<Uint8List>(
      name: name,
      initialValue: initalValue,
      onChanged: onChanged,
      builder: (field) {
        return GestureDetector(
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: MemoryImage(state),
            ),
          ),
          onTap: () async {
            try {
              final bytes = await notifier.pickAndCrop();
              field.didChange(bytes ?? initalValue);
            } catch (e) {
              if (e is PlatformException) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ImagePickErrorDialog();
                  },
                );
              }
            }
          },
        );
      },
    );
  }
}
