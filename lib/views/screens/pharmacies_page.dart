import 'package:e_services_niger/controllers/app_controller.dart';
import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:flutter/material.dart';

class PharmaciesPage extends StatelessWidget {
  const PharmaciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pharmacies = AppController.places.where((p) => p.type == 'Pharmacie').toList();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppHeader(title: 'Pharmacies', subtitle: 'Pharmacies proches de vous', showBack: true),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(18, 15, 18, 5),
                child: Row(
                  children: [
                    Chip(label: Text('Toutes')),
                    SizedBox(width: 7),
                    Chip(label: Text('Ouvertes')),
                    SizedBox(width: 7),
                    Chip(label: Text('24h/24')),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(18),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final p = pharmacies[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                        side: const BorderSide(color: Color(0xFFE5E5E5)),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFE2F3EB),
                          child: Icon(Icons.medication_rounded, color: Color(0xFF007A4D)),
                        ),
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
                        subtitle: Text('${p.address}\n${p.phone}', style: const TextStyle(fontSize: 10)),
                        isThreeLine: true,
                        trailing: Text(p.distance, style: const TextStyle(color: Color(0xFF007A4D), fontWeight: FontWeight.w700, fontSize: 11)),
                      ),
                    );
                  },
                  childCount: pharmacies.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
