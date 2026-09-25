import 'package:e_services_niger/models/video.dart';
import 'package:e_services_niger/views/screens/video_page.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  final VideoModel video;

  const VideoCard({
    required this.video,
    super.key,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool lecture = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // MINIATURE
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPage(
                    video: widget.video,
                  ),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green.shade100,
                  ),
                  clipBehavior: Clip.antiAlias,
                  // Pour l'instant, on met seulement un fond
                  child: Center(),
                ),
                // BOUTON PLAY
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 45,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // INFORMATIONS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.video.titreVal,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Date : '
                    '${DateTime.now().day}/'
                    '${DateTime.now().month}/'
                    '${DateTime.now().year}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}