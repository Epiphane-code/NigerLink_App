import 'package:e_services_niger/controllers/app_controller.dart';
import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/controllers/search_controller.dart';
import 'package:e_services_niger/models/place.dart';
import 'package:e_services_niger/models/service.dart';
import 'package:e_services_niger/views/screens/carte_maps.dart';
import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:e_services_niger/views/widgets/search_bar.dart';
import 'package:e_services_niger/views/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  final searchController = Searchcontroller();

  List<dynamic> results = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = context.read<ProviderController>();

      await provider.getServices();

      if (!mounted) return;

      setState(() {
        results = searchController.filter(
          '',
          provider.services,
          AppController.places,
        );
      });
    });
  }

  void search(String query) {
    final services = context.read<ProviderController>().services;
    final places = AppController.places;

    setState(() {
      results = searchController.filter(query, services, places);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              title: 'Recherche',
              subtitle: 'Trouvez rapidement un service ou un lieu',
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          CarteMaps(),
                                    ),
                                  );
                },
                icon: Icon(Icons.map),
                label: Text('Voir toute la carte'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
              child: ESsearchBar(controller: controller, onChanged: search),
            ),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        controller.text.isEmpty
                            ? 'Suggestions'
                            : '${results.length} résultat(s)',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = results[index];

                        // SERVICE
                        if (item is ServiceModel) {
                          return Column(
                            children: [
                              ServiceCard(
                                service: item,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ServiceDetailPage(service: item),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        }

                        // LIEU
                        if (item is Place) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            elevation: 0,
                            child: ListTile(
                              onTap: () {
                                // TODO: ouvrir la page du lieu
                              },
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFFF0E8),
                                child: Icon(
                                  Icons.place_rounded,
                                  color: Color(0xFFFF6900),
                                ),
                              ),
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text('${item.type} • ${item.address}'),
                              trailing: Text(
                                item.distance,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      }, childCount: results.length),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
