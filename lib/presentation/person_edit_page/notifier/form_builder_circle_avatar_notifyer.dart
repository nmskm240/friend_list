import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FormBuilderCircleAvatarNotifier extends StateNotifier<Uint8List> {
  FormBuilderCircleAvatarNotifier(Uint8List initialAvatar) : super(initialAvatar);

  Future<Uint8List?> pickAndCrop() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) {
      return null;
    }
    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (cropped == null) {
      return null;
    }
    state = await cropped.readAsBytes();
    return state;
  }
}
