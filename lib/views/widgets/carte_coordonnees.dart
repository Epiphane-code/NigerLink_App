import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarteCoordonnees extends StatelessWidget {
  final String latitude;
  final String longitude;
  final String nomLieu;

  const CarteCoordonnees({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.nomLieu,
  });

  @override
  Widget build(BuildContext context) {
    final lat = double.tryParse(latitude);
    final lng = double.tryParse(longitude);

    if (lat == null || lng == null) {
      return const Center(
        child: Text('Coordonnées invalides'),
      );
    }

    final position = LatLng(lat, lng);

    return FlutterMap(
      options: MapOptions(
        initialCenter: position,
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.e_services_niger',
        ),

        MarkerLayer(
          markers: [
            Marker(
              point: position,
              width: 120,
              height: 80,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Text(
                      nomLieu,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  const Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),

        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
            ),
          ],
        ),
      ],
    );
  }
}