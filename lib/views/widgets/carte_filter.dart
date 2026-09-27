import 'package:e_services_niger/models/categorie.dart';
import 'package:e_services_niger/models/coordonnee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CarteFilter extends StatelessWidget {
  final List<CoordonneeLatLnt> coordonneesList;
  final LatLng maPosition;
  const CarteFilter({required this.coordonneesList, required this.maPosition,super.key});

  @override
  Widget build(BuildContext context) {
    return  FlutterMap(
        options: MapOptions(initialCenter: maPosition, initialZoom: 12),
      
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.e_services_niger',
          ),
      
          MarkerLayer(
            markers: [
              Marker(
                point: maPosition,
                width: 120,
                height: 80,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(blurRadius: 4, color: Colors.black26),
                        ],
                      ),
                      child: const Text(
                        'Moi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
      
                    const Icon(
                      Icons.location_on,
                      size: 35,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
      
              ...coordonneesList.map((item) {
                final lat = double.tryParse(item.latitude);
                final lng = double.tryParse(item.longitude);
      
                if (lat == null || lng == null) {
                  return null;
                }
      
                return Marker(
                  point: LatLng(lat, lng),
                  width: 120,
                  height: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(blurRadius: 3, color: Colors.black26),
                          ],
                        ),
                        child: Text(
                          item.addressNomVal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
      
                      const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ],
                  ),
                );
              }).whereType<Marker>(),
            ],
          ),
      
          // =========================
          // ATTRIBUTION
          // =========================
          RichAttributionWidget(
            attributions: [TextSourceAttribution('OpenStreetMap contributors')],
          ),
        ],
      ) ;
  }
}