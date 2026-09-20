import 'package:e_services_niger/models/service.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onTap;

  const ServiceCard({super.key, required this.service, required this.onTap});

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
          contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 3, vertical: 3),
          leading: service.icon,
          title: Text(
            service.nomserviceVal,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF184838),
            ),
          ),
          subtitle: Text(service.sousCategorieVal, style: TextStyle(fontSize: 12),),
          trailing: (Random().nextInt(100) <= 50)? Text('Ouvert', style: TextStyle(color: Colors.green),) : Text('Ferme', style: TextStyle(color: Colors.red),)
        ),
        // Row(
        //   children: [
        //     service.icon!,
        //     const SizedBox(width: 8),
        //     Expanded(
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [

        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
