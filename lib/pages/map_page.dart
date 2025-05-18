import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sweep/widgets/currentLocationContainer.dart';
import 'package:sweep/widgets/trash_maker_child.dart';

// 大津市役所の緯度経度
const otsuCityOfficePosition = LatLng(35.01889586284015, 135.85529483505871);

class MapPage extends StatefulHookConsumerWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> with TickerProviderStateMixin {
  late AnimatedMapController animatedMapController;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    animatedMapController = AnimatedMapController(vsync: this);
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    final locationData = await location.getLocation();
    setState(() {
      currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  void dispose() {
    animatedMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: (tapPosition, point) {},
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                // マップ上のピン
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(34.97071403614474, 135.9420434866865),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      rotate: true,
                      child: GestureDetector(
                        onTap: () {
                          // タップ処理
                        },
                        child: TrashMakerChild(),
                      ),
                    ),
                  ],
                ),
                // 現在地ピン
                (currentLocation != null) ? MarkerLayer(
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
                ) : SizedBox.shrink(),
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
                          color: Theme.of(context).colorScheme.secondaryContainer
                        ),
                        child: Column(
                          children: [
                            IconButton.filledTonal(onPressed: () => animatedMapController.animatedZoomIn(), icon: Icon(Icons.add)),
                            IconButton.filledTonal(onPressed: () => animatedMapController.animatedZoomOut(), icon: Icon(Icons.remove)),
                          ],
                        ),
                      ),
                      (currentLocation != null) ? FloatingActionButton(
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
                      ) : SizedBox.shrink(),
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
