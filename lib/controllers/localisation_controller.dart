import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocalisationController extends ChangeNotifier {
  String _city = 'Niger';

  String get city => _city;

  LatLng? _maPosition;

  LatLng? get maPosition => _maPosition;

  Future<void> getCurrentCity() async {
    // 1. Vérifier si le GPS est activé
    final serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      debugPrint(
        'Ville non trouvée : localisation désactivée',
      );
      return;
    }

    // 2. Vérifier la permission
    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        debugPrint(
          'Ville non trouvée : permission refusée',
        );
        return;
      }
    }

    // 3. Permission définitivement refusée
    if (permission == LocationPermission.deniedForever) {
      debugPrint(
        'Ville non trouvée : permission définitivement refusée',
      );
      return;
    }

    // 4. Récupérer la position GPS
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    debugPrint('Latitude : ${position.latitude}');
    debugPrint('Longitude : ${position.longitude}');
    debugPrint('Altitude : ${position.altitude}');

    // IMPORTANT :
    // LatLng(latitude, longitude)
    _maPosition = LatLng(
      position.latitude,
      position.longitude,
    );

    // 5. Transformer les coordonnées en adresse
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      debugPrint(
        'Ville non trouvée : aucune adresse',
      );
      notifyListeners();
      return;
    }

    // 6. Premier résultat
    final place = placemarks.first;

    debugPrint(
      'Administrative area : ${place.administrativeArea}',
    );
    debugPrint(
      'Locality : ${place.locality}',
    );
    debugPrint(
      'SubAdministrativeArea : ${place.subAdministrativeArea}',
    );

    // 7. Récupérer la ville
    if (place.locality != null &&
        place.locality!.isNotEmpty) {
      _city = place.locality!;
    } else if (place.subAdministrativeArea != null &&
        place.subAdministrativeArea!.isNotEmpty) {
      _city = place.subAdministrativeArea!;
    }

    notifyListeners();

    debugPrint('Ville : $_city');
  }
}