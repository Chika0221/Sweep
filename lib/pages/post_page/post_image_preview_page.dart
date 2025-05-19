import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagePreviewPage extends HookConsumerWidget {
  const ImagePreviewPage(
      {super.key, required this.imagePaths, required this.index});

  final List<String> imagePaths;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePathsState = useState(imagePaths);

    return Stack(
      children: [
        Align(
          child: (Platform.isAndroid)
              ? Image.file(File(imagePathsState.value[index]))
              : Image.network(imagePathsState.value[index]),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: AppBar(
            backgroundColor: Colors.black.withAlpha(100),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(imagePathsState.value);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  imagePathsState.value.removeAt(index);
                  Navigator.of(context).pop(imagePathsState.value);
                },
                icon: Icon(Icons.delete_rounded),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}