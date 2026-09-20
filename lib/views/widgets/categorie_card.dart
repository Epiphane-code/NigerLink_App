import 'package:e_services_niger/models/categorie.dart';
import 'package:flutter/material.dart';

class CategorieCard extends StatelessWidget {
  final CategorieModel categorie;
  final VoidCallback? onTap;

  const CategorieCard({super.key, required this.categorie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
        decoration: BoxDecoration(
          color: const Color(0xFFE5F4EE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD5EAE1)),
        ),
        child: Row(
          children: [
            categorie.icon,
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                      categorie.categorieVal,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF184838),
                      ),
                    )
                 
            ),
          ],
        ),
      ),
    );
  }
}
