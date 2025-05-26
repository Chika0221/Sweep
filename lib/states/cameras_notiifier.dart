// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CamerasNotifier extends Notifier<List<CameraDescription>> {
  @override
  List<CameraDescription> build() => [];

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
    NotifierProvider<CamerasNotifier, List<CameraDescription>>(
  CamerasNotifier.new,
);
