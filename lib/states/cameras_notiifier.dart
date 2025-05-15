import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CamerasNotifier extends StateNotifier<List<CameraDescription>> {
  CamerasNotifier() : super([]);

  Future<void> init(BuildContext context) async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      state = cameras;
    } else {
      const snackbar = SnackBar(
        content: Text("カメラが確認できませんでした"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}

final camerasProvider =
    StateNotifierProvider.autoDispose<CamerasNotifier, List<CameraDescription>>((ref) {
  return CamerasNotifier();
});
