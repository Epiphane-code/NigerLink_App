import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/media.dart';
import 'package:e_services_niger/models/video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaCard extends StatelessWidget {
  final MediaModel media;
  final VoidCallback? onTap;
  const MediaCard({required this.media, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFFE5F4EE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD5EAE1)),
        ),
        child: ListTile(
          leading: media.nomserviceVal.toLowerCase().contains('rtn')
              ? Image.asset('assets/media/rtn.png', height: 50, width: 50)
              : media.nomserviceVal.toLowerCase().contains('tal tv')
              ? Image.asset('assets/media/taltv.jpeg', height: 50, width: 50)
              : media.nomserviceVal.toLowerCase().contains('dounia tv')
              ? Image.asset('assets/media/dounia-tv.jpg', height: 50, width: 50)
              : media.nomserviceVal.toLowerCase().contains('radio bonferey')
              ? Image.asset('assets/media/bonferey.png')
              : media.nomserviceVal.toLowerCase().contains('actuniger')
              ? Image.asset('assets/media/actuniger.jpeg')
              : Image.asset('assets/media/tv.jpeg'),
          title: Text(
            media.nomserviceVal,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(media.nomserviceVal),
              Text(
                (media.descriptionVal.length <= 30)
                    ? media.descriptionVal
                    : '${media.descriptionVal.substring(0, 30)}...plus',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
