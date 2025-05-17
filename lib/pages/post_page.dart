import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/states/image_notifier.dart';
import 'package:sweep/states/post_notifier.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePaths = useState([ref.watch(imagePathProvider)]);
    final textController = useState(TextEditingController());
    final postData = ref.watch(postProvider);

    useEffect((){
      ref.read(postProvider.notifier).clear();
      return (){
        textController.dispose();
      };
    },[]);

    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: CarouselView.weighted(
            itemSnapping: true,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            onTap: (index) async {
              if (index < imagePaths.value.length){
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImagePreviewPage(imagePath: imagePaths.value[index]),
                  ),
                );
              }else{
                showDialog(
                  context: context,
                  builder: (context){
                    return SimpleDialog(
                      children: [
                        ListTile(
                          onTap: () async {
                            if(await ref.read(imagePathProvider.notifier).pickImageFromGallery()){
                              imagePaths.value.add(ref.watch(imagePathProvider));
                            }
                            Navigator.of(context).pop();
                          },
                          title: Text("ギャラリーから選択"),
                        ),
                        ListTile(
                          onTap: () async {
                            if(await ref.read(imagePathProvider.notifier).pickImageFromCamera()){
                              imagePaths.value.add(ref.watch(imagePathProvider));
                            }
                            Navigator.of(context).pop();
                          },
                          title: Text("カメラで撮影"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            flexWeights: [8,2],
            children: List.generate(
              imagePaths.value.length + 1,
              (index){
                if (index < imagePaths.value.length){
                  return Image.file(
                    File(imagePaths.value[index]),
                    fit: BoxFit.cover,
                  );
                }else{
                  return Center(
                    child: IconButton.filled(onPressed: (){}, icon: Icon(Icons.add)),
                  );
                }
                
              },
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.surface,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            controller: textController.value,
            maxLines: 2,
            minLines: 1,
            decoration: InputDecoration(
              hintText: "コメント",
              border: InputBorder.none
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: FilledButton(onPressed: (){}, child: Text("投稿する")),
        ),
      ],
    );
  }
}


class ImagePreviewPage extends HookConsumerWidget {
  const ImagePreviewPage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(
          child: Image.file(File(imagePath)),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}