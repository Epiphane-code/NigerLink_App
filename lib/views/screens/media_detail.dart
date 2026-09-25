import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/media.dart';
import 'package:e_services_niger/models/video.dart';
import 'package:e_services_niger/views/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaDetail extends StatelessWidget {
  final MediaModel media;
  const MediaDetail({required this.media, super.key});

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> videos = context.watch<ProviderController>().videos;
    List<VideoModel> VideosFiltre = [];

    VideosFiltre.addAll(
      videos.where((element) => (element.serviceIdVal == media.idVal)),
    );
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
                  width: double.infinity,
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
                      SizedBox(height: 10),
                      ListTile(
                        leading:
                            media.nomserviceVal.toLowerCase().contains(
                              'rtn',
                            )
                            ? Image.asset(
                                'assets/media/rtn.png',
                                height: 80,
                                width: 80,
                              )
                            : media.nomserviceVal.toLowerCase().contains(
                                'tal tv',
                              )
                            ? Image.asset(
                                'assets/media/taltv.jpeg',
                                height: 80,
                                width: 80,
                              )
                            : media.nomserviceVal.toLowerCase().contains(
                                'dounia tv',
                              )
                            ? Image.asset(
                                'assets/media/dounia-tv.jpg',
                                height: 80,
                                width: 80,
                              )
                            : media.nomserviceVal.toLowerCase().contains(
                                'radio bonferey',
                              )
                            ? Image.asset(
                                'assets/media/bonferey.png',
                                height: 80,
                                width: 80,
                              )
                            : Image.asset(
                                'assets/media/tv.jpeg',
                                height: 80,
                                width: 80,
                              ),
                        title: Text(
                          media.nomserviceVal,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          '${media.categorieVal} - ${media.categorieVal}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 12,),),
        
              SliverList(
                delegate: SliverChildBuilderDelegate((context, i) {
                  final p = VideosFiltre[i];
                  return VideoCard(video: p);
                }, childCount: VideosFiltre.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
