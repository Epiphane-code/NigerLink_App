import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocalisationController extends ChangeNotifier {
  String _city = 'Niger';

  String get city => _city;

  late LatLng _maPosition;
  LatLng get maPosition => _maPosition;

  Future<void> getCurrentCity() async {

    // 1. Vérifier si le GPS est activé
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print('Ville non trouvée : localisation désactivée');
      return;
    }

    // 2. Vérifier la permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        print('Ville non trouvée : permission refusée');
        return;
      }
    }

    // 3. Permission définitivement refusée
    if (permission == LocationPermission.deniedForever) {
      print('Ville non trouvée : permission définitivement refusée');
      return;
    }

    // 4. Récupérer les coordonnées GPS
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
      
    );
    _maPosition = LatLng(position.altitude, position.longitude);

    print('Latitude : ${position.latitude}');
    print('Longitude : ${position.longitude}');

    // 5. Transformer les coordonnées en adresse
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      print('Ville non trouvée : aucune adresse');
      return;
    }

    // 6. Récupérer le premier résultat
    final place = placemarks.first;
    print(place.administrativeArea);

    // 7. Récupérer la ville

    if(place.locality != null){
      _city = place.locality!;
    }
    else if(place.subAdministrativeArea != null){
      _city = place.subAdministrativeArea!;
    }

    notifyListeners();

    print('Ville : $_city');
  }
}