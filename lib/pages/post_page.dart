import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/states/image_provider.dart';
import 'package:sweep/states/post_notifier.dart';
import 'package:sweep/widgets/rounded_image.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePaths = [ref.watch(imagePathProvider)];
    final postData = ref.watch(postProvider);

    useEffect((){
      return (){
        ref.read(postProvider.notifier).clear();
      };
    },[]);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: CarouselView.weighted(
            onTap: (index) async {
              if (index < imagePaths.length){
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImagePreviewPage(imagePath: imagePaths[index]),
                  ),
                );
              }else{

              }
            },
            flexWeights: [8,2],
            children: List.generate(
              imagePaths.length + 1,
              (index){
                if (index < imagePaths.length){
                  return RoundedImage(imagePath: imagePaths[index]);  
                }else{
                  return Center(
                    child: IconButton.filled(onPressed: (){}, icon: Icon(Icons.add)),
                  );
                }
                
              },
            ),
          ),
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