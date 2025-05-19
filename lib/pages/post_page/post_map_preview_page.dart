import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/widgets/currentLocationContainer.dart';

class MapPreviewPage extends HookConsumerWidget {
  const MapPreviewPage(
      {super.key, required this.controller, required this.currentLocation});

  final AnimatedMapController controller;
  final LatLng currentLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<LatLng?> selectedPoint = useState(null);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlutterMap(
          mapController: controller.mapController,
          options: MapOptions(
            initialCenter: currentLocation,
            initialZoom: 13.0,
            maxZoom: 20.0,
            minZoom: 8.0,
            initialRotation: 0,
            onTap: (tapPosition, location) {
              selectedPoint.value = location;
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
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
            (selectedPoint.value != null)
                ? MarkerLayer(
                    markers: [
                      Marker(
                        point: selectedPoint.value!,
                        child: Icon(
                          Icons.location_on_rounded,
                          size: 30,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            Positioned(
              right: 8,
              bottom: 8,
              child: FloatingActionButton(
                onPressed: () => controller.animateTo(
                  dest: currentLocation,
                  zoom: 15.0,
                  rotation: 0,
                ),
                shape: CircleBorder(),
                child: Icon(Icons.location_searching_rounded),
              ),
            ),
            (selectedPoint.value != null)
                ? Positioned(
                    left: 8,
                    bottom: 8,
                    child: SizedBox(
                      height: 56,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop(selectedPoint.value);
                        },
                        child: Text("決定"),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
