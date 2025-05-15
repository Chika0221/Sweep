import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState(MapController());

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
                initialCenter:
                    const LatLng(34.96463676923493, 135.94087957022967),
                // 一倍は世界地図
                initialZoom: 14.0,
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
                  top: 8,
                  right: 8,
                  child: IconButton.filled(
                    onPressed: () {},
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
