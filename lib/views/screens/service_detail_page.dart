import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/service.dart';
import 'package:e_services_niger/views/widgets/carte_coordonnees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceDetailPage extends StatefulWidget {
  final ServiceModel service;

  const ServiceDetailPage({super.key, required this.service});

  @override
  State<ServiceDetailPage> createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderController>().getCoordonnees();
    });
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    final provider = context.watch<ProviderController>();

    // Recherche des coordonnées correspondant au service
    final coordonnees = provider.coordonnees.where(
      (coordonnee) => coordonnee.nomId == service.idVal,
    );

    // On récupère la première coordonnée si elle existe
    final coordonnee = coordonnees.isNotEmpty ? coordonnees.first : null;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 28),
                decoration: const BoxDecoration(
                  color: Color(0xFF007A4D),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),

                    const SizedBox(height: 10),

                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: service.icon,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      service.nomserviceVal,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '${service.sousCategorieVal} - ${service.categorieVal}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(18),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Informations',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFFE5E5E5)),
                    ),
                    child: Text(
                      service.aproposVal,
                      style: const TextStyle(
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Services disponibles',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),

                  const SizedBox(height: 10),

                  const Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFF007A4D),
                      ),
                      SizedBox(width: 20),
                      Text('Horaires', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                   const SizedBox(height: 20),

                  // ==============================
                  // CARTE
                  // ==============================
                  if (coordonnee != null)
                    Container(
                      height: 300,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CarteCoordonnees(
                        latitude: coordonnee.latitude,
                        longitude: coordonnee.longitude,
                        nomLieu: service.nomserviceVal,
                      ),
                    ),

                  const SizedBox(height: 8),

                  if(service.horaire.length == 7)
                  ...[
                    "Lun  ${service.horaire[0]}",
                    "Mar  ${service.horaire[1]}",
                    "Mer  ${service.horaire[2]}",
                    "Jeu  ${service.horaire[3]}",
                    "Ven  ${service.horaire[4]}",
                    "Sam  ${service.horaire[5]}",
                    "Dim  ${service.horaire[6]}",
                  ].map(
                    (text) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.access_time_rounded,
                        color: Color(0xFF007A4D),
                      ),
                      title: Text(
                        text,
                        style: TextStyle(fontWeight: FontWeight.w600, color: text.contains('close') ? Colors.red: Colors.black),
                      ),
                    ),
                  ),

                 
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
