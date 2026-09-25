import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/media.dart';
import 'package:e_services_niger/views/screens/media_detail.dart';
import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:e_services_niger/views/widgets/media_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<MediaPage> {
  late List<MediaModel> medias;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<ProviderController>();

      provider.getMedia();
      provider.getVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderController>();

    medias = provider.medias;


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
                  else if (medias.isEmpty)
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
                          final media = medias[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: MediaCard(
                              media: media,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MediaDetail(media: media);
                                  },
                                );
                              },
                            ),
                          );
                        }, childCount: medias.length),
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
