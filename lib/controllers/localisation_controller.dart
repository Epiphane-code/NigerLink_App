import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocalisationController extends ChangeNotifier {
String? _city ;
String get city { if (_city != null){return _city!;} return 'Niger';}
Future<void> getCurrentCity() async {
  _city = null;
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    _city = null;
    print('ville non trouve 1');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      _city = null;
    print('ville non trouve 2');

    }
  }

  if (permission == LocationPermission.deniedForever) {
    _city = null;
    print('ville non trouve 3');

  }

  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ),
  );

  final placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  if (placemarks.isEmpty) {
    _city = null;
    print('ville non trouve 4');

  }

  final place = placemarks.first;
_city = place.subAdministrativeArea;

}
}