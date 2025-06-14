// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/pages/map_page/currentLocationContainer.dart';
import 'package:sweep/pages/map_page/filter_block.dart';
import 'package:sweep/pages/map_page/trash_maker_child.dart';
import 'package:sweep/pages/map_page/trashbox_dialog.dart';
import 'package:sweep/pages/timaline_page/post_item.dart';
import 'package:sweep/states/get_posts_provider.dart';
import 'package:sweep/states/get_trashbox_provider.dart';
import 'package:sweep/states/location_notifier.dart';

class MapPage extends StatefulHookConsumerWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage>
    with TickerProviderStateMixin {
  late AnimatedMapController animatedMapController;

  @override
  void initState() {
    super.initState();
    animatedMapController = AnimatedMapController(vsync: this);
    // ref.read(location)
  }

  @override
  void dispose() {
    animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(getPostsProvider);
    final trashBoxData = ref.watch(getTrashBoxsProvider);
    final currentLocation = ref.watch(locationProvider);

    useEffect(() {
      ref.read(locationProvider.notifier).getCurrentLocation();
    }, []);

    return SafeArea(
      child: FlutterMap(
        mapController: animatedMapController.mapController,
        options: MapOptions(
          initialCenter: otsuCityOfficePosition,
          initialZoom: 13.0,
          maxZoom: 20.0,
          minZoom: 8.0,
          initialRotation: 0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),

          // ユーザーの投稿情報
          postData.when(
            data: (data) {
              return MarkerLayer(
                markers: List.generate(
                  data.length,
                  (index) {
                    final post = data[index];
                    return Marker(
                      point: post.location,
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      rotate: true,
                      child: GestureDetector(
                        onTapDown: (details) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: PostItem(post: post),
                            ),
                          );
                        },
                        child: TrashMakerChild(
                          type: post.type,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          trashBoxData.when(
            data: (data) {
              return MarkerLayer(
                markers: List.generate(
                  data.length,
                  (index) {
                    final trashBox = data[index];
                    return Marker(
                      point: trashBox.location,
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      rotate: true,
                      child: GestureDetector(
                        onTapDown: (details) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: TrashboxDialog(trashBox: trashBox),
                            ),
                          );
                        },
                        child: TrashMakerChild(
                          type: PostType.trashBox,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          // 現在地ピン
          if (currentLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: currentLocation!,
                  child: Currentlocationcontainer(
                    diameter: 32,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    lineColor: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),

          // フィルターブロック
          FilterBlock(
            filterOptions: [
              PostType.trash,
              PostType.trashCan,
              PostType.trashBox,
            ],
          ),

          // 現在地ボタン
          Positioned(
            bottom: 8,
            right: 8,
            child: Column(
              spacing: 8,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Column(
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          ref.read(getPostsProvider.notifier).refresh();
                          ref.read(getTrashBoxsProvider.notifier).refresh();
                        },
                        icon: Icon(Icons.refresh_rounded),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      IconButton.filledTonal(
                        onPressed: () => animatedMapController.animatedZoomIn(),
                        icon: Icon(Icons.add),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      IconButton.filledTonal(
                          onPressed: () =>
                              animatedMapController.animatedZoomOut(),
                          icon: Icon(Icons.remove)),
                    ],
                  ),
                ),
                if (currentLocation != null)
                  FloatingActionButton(
                    shape: CircleBorder(),
                    onPressed: () {
                      animatedMapController.animateTo(
                        dest: currentLocation,
                        zoom: 15.0,
                        rotation: 0,
                      );
                    },
                    child: const Icon(
                      // Icons.location_searching_rounded,
                      Icons.navigation_rounded,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
