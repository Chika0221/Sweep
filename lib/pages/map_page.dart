import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sweep/classes/post.dart';
import 'package:sweep/states/get_posts_notifier.dart';
import 'package:sweep/states/location_notifier.dart';
import 'package:sweep/widgets/currentLocationContainer.dart';
import 'package:sweep/widgets/trash_maker_child.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    final postData = ref.watch(postStreamProvider);
    final currentLocation = ref.watch(locationProvider);

    useEffect(() {
      ref.read(locationProvider.notifier).getCurrentLocation();
    }, []);

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
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
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(post.comment),
                                      content:
                                          Image.network(post.imagePaths[0]),
                                    );
                                  },
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
                  error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () {
                    return Positioned(
                      left: 16,
                      top: 16,
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

                // 現在地ピン
                (currentLocation != null)
                    ? MarkerLayer(
                        markers: [
                          Marker(
                            point: currentLocation!,
                            child: Currentlocationcontainer(
                              diameter: 32,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              lineColor: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                // 現在地ボタン
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Column(
                    spacing: 4,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        child: Column(
                          children: [
                            IconButton.filledTonal(
                                onPressed: () =>
                                    animatedMapController.animatedZoomIn(),
                                icon: Icon(Icons.add)),
                            IconButton.filledTonal(
                                onPressed: () =>
                                    animatedMapController.animatedZoomOut(),
                                icon: Icon(Icons.remove)),
                          ],
                        ),
                      ),
                      (currentLocation != null)
                          ? FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                animatedMapController.animateTo(
                                  dest: currentLocation,
                                  zoom: 15.0,
                                  rotation: 0,
                                );
                              },
                              child: const Icon(
                                Icons.location_searching_rounded,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
          child: Center(
            child: Text("ここでフィルターとか"),
          ),
        ),
      ],
    );
  }
}
