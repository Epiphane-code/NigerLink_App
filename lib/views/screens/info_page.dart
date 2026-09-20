import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/info.dart';
import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:e_services_niger/views/widgets/info_card.dart';
import 'package:e_services_niger/views/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late List<InfoModel> infos;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ProviderController>();

      provider.getInfos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderController>();

    final List<InfoModel> infos = provider.infos;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              title: 'Info & Media',
              subtitle: 'Ici les informations sont fiables',
            ),

            const SizedBox(height: 10),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  if (provider.isLoading)
                    const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    )
                  else if (infos.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Aucune information disponible',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final info = infos[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: InfoCard(
                              info: info,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AppPopup(info: info);
                                  },
                                );
                              },
                            ),
                          );
                        }, childCount: infos.length),
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
