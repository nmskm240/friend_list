import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FormBuilderCircleAvatarNotifier extends StateNotifier<Uint8List> {
  FormBuilderCircleAvatarNotifier(Uint8List initialAvatar) : super(initialAvatar);

  Uint8List get bytes => state;

  Future<void> pickAndCrop() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) {
      return;
    }
    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (cropped == null) {
      return;
    }
    state = await cropped.readAsBytes();
  }
}
