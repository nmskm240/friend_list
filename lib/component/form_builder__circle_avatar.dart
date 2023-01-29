import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FormBuilderCircleAvatar extends ConsumerWidget {
  final String name;
  final double radius;
  final String defaultIconPath;
  final String initialIcon;
  late final StateProvider<Uint8List> circleAvatarProvider;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onReset;
  final String Function(String?)? validator;

  FormBuilderCircleAvatar({
    super.key,
    required this.name,
    this.radius = 60,
    this.defaultIconPath = "assets/images/default_avatar.png",
    this.initialIcon = "",
    this.onChanged,
    this.onSaved,
    this.onReset,
    this.validator,
  }) {
    circleAvatarProvider = StateProvider<Uint8List>((ref) => base64.decode(initialIcon));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderField<String>(
      key: super.key,
      name: name,
      initialValue: "",
      builder: (FormFieldState<String> field) {
        return GestureDetector(
          child: CircleAvatar(
            backgroundImage: _loadIconOrDefault(ref),
            radius: radius,
          ),
          onTap: () async {
            await _onTap(ref);
            final bytes = ref.read(circleAvatarProvider);
            field.didChange(base64.encode(bytes));
          },
        );
      },
      onChanged: onChanged,
      onSaved: onSaved,
      onReset: onReset,
      validator: validator,
    );
  }

  ImageProvider _loadIconOrDefault(WidgetRef ref) {
    return ref.watch(circleAvatarProvider).isEmpty
        ? AssetImage(defaultIconPath) as ImageProvider
        : MemoryImage(ref.read(circleAvatarProvider));
  }

  Future<void> _onTap(WidgetRef ref) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) {
      return;
    }
    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "Icon",
          initAspectRatio: CropAspectRatioPreset.square,
          hideBottomControls: true,
        ),
        IOSUiSettings(
          title: "Icon",
          aspectRatioPickerButtonHidden: true,
          hidesNavigationBar: true,
        ),
      ],
      cropStyle: CropStyle.circle,
    );
    if (cropped == null) {
      return;
    }
    final bytes = await cropped.readAsBytes();
    ref.read(circleAvatarProvider.notifier).state = bytes;
  }
}
