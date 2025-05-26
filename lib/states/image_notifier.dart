// Package imports:
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePathNotifier extends Notifier<String> {
  @override
  String build() => "";

  Future<void> takePicture(CameraController cameraController) async {
    final file = await cameraController.takePicture();
    state = file.path;
  }

  Future<bool> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state = image.path;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = image.path;
      return true;
    } else {
      return false;
    }
  }
}

final imagePathProvider =
    NotifierProvider<ImagePathNotifier, String>(ImagePathNotifier.new);
