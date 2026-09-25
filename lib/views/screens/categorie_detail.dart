import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/categorie.dart';
import 'package:e_services_niger/models/place.dart';
import 'package:e_services_niger/utilities/utils.dart';
import 'package:e_services_niger/views/screens/service_detail_page.dart';
import 'package:e_services_niger/views/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_services_niger/controllers/search_controller.dart';

class CategorieDetail extends StatelessWidget {
  final CategorieModel categorie;
  const CategorieDetail({required this.categorie, super.key});

  @override
  Widget build(BuildContext context) {
    final liste = context.watch<ProviderController>().services;
    final List<Place> liste2 =  [];
    final filtercontroller = Searchcontroller();
    final listefilter = filtercontroller.filter(
      categorie.categorieVal,
      liste,
      liste2,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 28),
              decoration: const BoxDecoration(
                color: Color(0xFF007A4D),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
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
                    child: categorieIcon(categorie.categorieVal),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    categorie.categorieVal,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    categorie.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
        
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              width: double.infinity,
        
              child: Text(
                'Les services et services disponibles',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
        
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final service = listefilter[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ServiceCard(service: service, onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              ServiceDetailPage(service: service),
                                        ),
                                      );
                                    }, ),
                      );
                    }, childCount: listefilter.length),
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
