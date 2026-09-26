import 'package:e_services_niger/controllers/localisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class CarteMaps extends StatefulWidget {
  const CarteMaps({super.key});

  @override
  State<CarteMaps> createState() => _CarteMapsState();
}

class _CarteMapsState extends State<CarteMaps> {
  late LatLng maPosition;
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<LocalisationController>();

      maPosition = provider.maPosition;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
      options: MapOptions(
        initialCenter: maPosition,
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
              point: maPosition,
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
                      "Ma position",
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
    ),
    );
  }
}