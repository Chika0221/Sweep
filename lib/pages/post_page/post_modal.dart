import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/pages/post_page/post_camera_page.dart';
import 'package:sweep/pages/post_page/post_page.dart';

class PostModal extends HookConsumerWidget {
  const PostModal({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pageController = useState(PageController(
      keepPage: true,
      initialPage: 0,
    ));

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
        body: PageView(
          controller: pageController.value,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PostCameraPage(nextPage: (){
              pageController.value.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },),
            PostPage(),
          ],
        ),
      ),
    );
  }
}