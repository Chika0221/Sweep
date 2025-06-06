// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

// 大津市役所の緯度経度
const otsuCityOfficePosition = LatLng(35.01889586284015, 135.85529483505871);

class LocationNotifier extends Notifier<LatLng> {
  @override
  build() {
    return LatLng(0, 0);
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

    state = LatLng(locationData.latitude!, locationData.longitude!);
  }
}

final locationProvider =
    NotifierProvider<LocationNotifier, LatLng>(LocationNotifier.new);
