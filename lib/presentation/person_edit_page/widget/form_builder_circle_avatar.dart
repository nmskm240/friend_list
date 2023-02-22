import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_edit_page/provider/form_builder_circle_avatar_provider.dart';
import 'package:friend_list/presentation/person_edit_page/widget/image_pick_error_dialog.dart';

class FormBuilderCircleAvatar extends ConsumerWidget {
  final String name;
  final Uint8List initalValue;

  const FormBuilderCircleAvatar({
    super.key,
    required this.name,
    required this.initalValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier =
        ref.read(formBuilderCircleAvatarProvider(initalValue).notifier);
    final state = ref.watch(formBuilderCircleAvatarProvider(initalValue));
    return FormBuilderField(
      name: name,
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
              await notifier.pickAndCrop();
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
