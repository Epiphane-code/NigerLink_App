import 'package:e_services_niger/models/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final VideoModel video;

  const VideoPage({
    required this.video,
    super.key,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final id = YoutubePlayerController.convertUrlToId(
      widget.video.urlVideoVal,
    );

    if (id == null) {
      throw Exception('URL YouTube invalide');
    }

    controller = YoutubePlayerController.fromVideoId(
      videoId: id,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SafeArea(
        child: Column(
          children: [

            // HEADER
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF007A4D),
              ),
              child: Row(
                children: [
                  // Titre
                  Expanded(
                    child: Text(
                      widget.video.titreVal,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Fermer
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // VIDEO
            YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
              enableFullScreenOnVerticalDrag: false,
              keepAlive: false,
            ),

            // INFORMATIONS
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      widget.video.titreVal,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007A4D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Date : '
                      '${DateTime.now().day}/'
                      '${DateTime.now().month}/'
                      '${DateTime.now().year}',
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Source : YouTube',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}