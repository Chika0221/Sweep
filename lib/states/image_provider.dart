import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImagePathNotifier extends StateNotifier<String> {
  ImagePathNotifier() : super("");


  void takePicture(CameraController cameraController) async {
    final file = await cameraController.takePicture();
    state = file.path;
  }

  void pictureFromImagePicker(String path) async {
    state = path;
  }
}

final imagePathProvider = StateNotifierProvider<ImagePathNotifier, String>((ref){
  return ImagePathNotifier();
});