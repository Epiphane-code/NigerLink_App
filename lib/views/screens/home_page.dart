import 'package:e_services_niger/controllers/auth_controller.dart';
import 'package:e_services_niger/controllers/localisation_controller.dart';
import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/views/screens/categorie_detail.dart';
import 'package:e_services_niger/views/screens/emergency_page.dart';
import 'package:e_services_niger/views/widgets/categorie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Charger les catégories une seule fois
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderController>().getCategorie();
      context.read<LocalisationController>().getCurrentCity();
    });
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderController>();
    final auth = context.read<AuthController>();
    final ville = context.watch<LocalisationController>().city;

    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF007A4D)),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF007A4D),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Bonjour ${auth.user}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.14),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 12,
                            ),
                            SizedBox(width: 3),
                            Text(
                              ville,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'NigerLink',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      height: .95,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ESsearchBar(
                  //   controller: search,
                  //   onChanged: (_) {
                  //     setState(() {});
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              width: double.infinity,

              child: Text(
                'Catégories des lieux et services',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // =========================
                  // HEADER
                  // =========================

                  // =========================
                  // URGENCES
                  // =========================
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
                    sliver: SliverToBoxAdapter(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const EmergencyPage(fullPage: true),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(13),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6900),
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.warning_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Numéros d’urgence',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      'Pompiers • Police • SAMU • 112',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // =========================
                  // TITRE CATÉGORIES
                  // =========================

                  // =========================
                  // CATÉGORIES
                  // =========================
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    sliver: provider.isLoading
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : SliverGrid(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final categorie = provider.categories[index];

                              return CategorieCard(
                                categorie: categorie,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          CategorieDetail(categorie: categorie),
                                    ),
                                  );
                                },
                              );
                            }, childCount: provider.categories.length),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2.5,
                                ),
                          ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
