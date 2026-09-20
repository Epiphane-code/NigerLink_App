import 'package:e_services_niger/models/info.dart';
import 'package:flutter/material.dart';
class InfoCard extends StatelessWidget {
  final InfoModel info;
  final VoidCallback? onTap;
  const InfoCard({required this.info, this.onTap,super.key});

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
          leading: Icon(Icons.campaign_outlined),
          title: Text(info.nomserviceVal, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(info.title),
              Text((info.contenuVal.length <= 50)? info.contenuVal : '${info.contenuVal.substring(0, 50)}...plus', style: TextStyle(color: Colors.black54),),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}