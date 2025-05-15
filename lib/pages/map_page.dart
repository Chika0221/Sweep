import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

// 大津市役所の緯度経度
const otsuCityOfficePosition = LatLng(35.01889586284015, 135.85529483505871);

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState(MapController());
    final currentLocation = useState(otsuCityOfficePosition);

    Future<void> getcurrentlocation() async {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      final position = await location.getLocation();
      currentLocation.value = LatLng(position.latitude!, position.longitude!);
    }

    useEffect(() {
      getcurrentlocation();
    }, []);

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: FlutterMap(
              mapController: mapController.value,
              options: MapOptions(
                // 龍大瀬田キャンパスの緯度経度
                initialCenter: otsuCityOfficePosition,
                // 一倍は世界地図
                initialZoom: 13.0,
                // 拡大設定
                maxZoom: 20.0,
                // 縮小設定
                minZoom: 8.0,
                // 初期回転角度
                initialRotation: 0,
                onTap: (tapPotision, point) {},
              ),
              children: [
                TileLayer(
                  // オープンソースのopenStreetMap
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
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
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 64,
                  right: 8,
                  child: IconButton.filled(
                    onPressed: () {
                      mapController.value.move(currentLocation.value, 15.0);
                    },
                    icon: Icon(
                      Icons.location_searching_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: Center(
            child: Text("ここでフィルターとか"),
          ),
        ),
      ],
    );
  }
}
