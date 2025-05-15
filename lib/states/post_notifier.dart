import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostNotifier extends StateNotifier<String> {
  PostNotifier() : super("");

  void takePicture(BuildContext context, CameraController controller) async {
    final file = await controller.takePicture();
    state = file.path;
    goNextPage(context);
  }

  void pictureFromImagePicker(String path) async {
    state = path;
  }

  void goNextPage(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(
          child: Center(
            child: Image.file(File(state)),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }
}

final postProvider = StateNotifierProvider<PostNotifier, String>((ref) {
  return PostNotifier();
});
