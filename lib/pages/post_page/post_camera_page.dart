import 'package:camera/camera.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../states/cameras_notiifier.dart';
import '../../states/image_notifier.dart';
import 'shutter_button.dart';

class PostCameraPage extends HookConsumerWidget {
  const PostCameraPage({super.key, required this.nextPage});

  final void Function() nextPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // initState
    useEffect(() {
      ref.read(camerasProvider.notifier).init(context);
      return null;
    }, []);

    final cameras = ref.watch(camerasProvider);

    if (cameras.isEmpty) {
      return Center(
        child: Text("カメラが利用できません。設定を確認してください。"),
      );
    }

    late ValueNotifier<CameraController> controller;
    late Future<void> initializeControllerFuture;

    // カメラが存在する場合実行
    useEffect(() {
      controller = useState(CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      ));
      initializeControllerFuture =
          controller.value.initialize().catchError((error) {
        debugPrint("カメラの初期化中にエラーが発生しました: $error");
      });
      return null;
    }, [cameras]);

    return FutureBuilder(
      future: initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CameraPreview(controller.value),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                children: [
                                  ListTile(
                                    title: Text("ギャラリーから選択"),
                                    onTap: () async {
                                      await ref
                                          .read(imagePathProvider.notifier)
                                          .pickImageFromGallery();
                                      Navigator.of(context).pop();
                                      nextPage();
                                    },
                                  ),
                                  ListTile(
                                    title: Text("カメラで撮影"),
                                    onTap: () async {
                                      await ref
                                          .read(imagePathProvider.notifier)
                                          .pickImageFromCamera();
                                      Navigator.of(context).pop();
                                      nextPage();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.photo,
                          size: 48,
                        ),
                      ),
                    ),
                    ShutterButton(
                      onTap: () async {
                        await ref
                            .read(imagePathProvider.notifier)
                            .takePicture(controller.value);
                        nextPage();
                      },
                      diameter: 84,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      lineColor: Theme.of(context).colorScheme.surface,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
