import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/numero_urgence.dart';
import 'package:e_services_niger/utilities/utils.dart';
import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmergencyPage extends StatefulWidget {
  final bool fullPage;

  const EmergencyPage({
    super.key,
    this.fullPage = false,
  });

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {

  @override
  void initState() {
    super.initState();
WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderController>().getUrgences();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<NumeroUrgence> urgences = context.watch<ProviderController>().urgences;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppHeader(
                title: 'Numero d\'urgence',
                subtitle: 'Les numeros utils en cas d\'urgence',
                showBack: false,
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(18),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final e = urgences[i];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFE8E8E8),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => appeler(e.telephoneVal),
                        child: Row(
                          children: [
                            Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: i == 2
                                    ? const Color(0xFFE8F5EF)
                                    : const Color(0xFFFFF0E8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                i == 2
                                    ? Icons.local_police_rounded
                                    : Icons.emergency_rounded,
                                color: i == 2
                                    ? const Color(0xFF007A4D)
                                    : const Color(0xFFFF6900),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.nomserviceVal,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  const SizedBox(height: 3),

                                  Text(
                                    e.descriptionVal,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: i == 2
                                    ? const Color(0xFF007A4D)
                                    : const Color(0xFFFF6900),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                e.telephoneVal,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: urgences.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}