import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/pages/home_page.dart';
import 'package:sweep/pages/map_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/pages/post_page/post_modal.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    final pageController = useState(PageController(
      keepPage: true,
      initialPage: 0,
    ));

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        pageController.value.animateToPage(
          selectedIndex.value,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      });

      return null;
    }, [selectedIndex.value]);

    return Scaffold(
      body: PageView(
        controller: pageController.value,
        pageSnapping: false,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          MapPage(),
        ],
        onPageChanged: (value) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          useSafeArea: true,
          builder: (context) {
            return PostModal();
          },
        ),
        label: Text("投稿する"),
        icon: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: "ホーム"),
          SizedBox(),
          NavigationDestination(icon: Icon(Icons.map_rounded), label: "マップ"),
        ],
        onDestinationSelected: (selected) {
          selectedIndex.value = selected;
        },
      ),
    );
  }
}
