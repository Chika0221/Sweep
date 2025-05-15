import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sweep/states/cameras_notiifier.dart';
import 'package:sweep/states/post_notifier.dart';
import 'package:sweep/widgets/shutter_button.dart';

class PostModal extends HookConsumerWidget {
  const PostModal({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return PostPage();
      },
    );
  }
}

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

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
      return () {
        controller.dispose();
      };
    }, [cameras]);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("投稿"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_rounded),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
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
                                          final ImagePicker _picker =
                                              ImagePicker();
                                          final XFile? image =
                                              await _picker.pickImage(
                                                  source: ImageSource.gallery);
                                          ref
                                              .read(postProvider.notifier)
                                              ..pictureFromImagePicker(
                                                  image!.path)
                                              ..goNextPage(context);;
                                        },
                                      ),
                                      ListTile(
                                        title: Text("カメラで撮影"),
                                        onTap: () async {
                                          final ImagePicker _picker =
                                              ImagePicker();

                                          final XFile? photo =
                                              await _picker.pickImage(
                                                  source: ImageSource.camera);
                                          ref
                                              .read(postProvider.notifier)
                                              ..pictureFromImagePicker(
                                                  photo!.path)
                                              ..goNextPage(context);
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
                            ref
                                .read(postProvider.notifier)
                                .takePicture(context, controller.value);


                          },
                          diameter: 84,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
        ),
      ),
    );
  }
}
