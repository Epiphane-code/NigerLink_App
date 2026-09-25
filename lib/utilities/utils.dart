import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


  Future<void> appeler(String numero) async {
  final Uri uri = Uri(
    scheme: 'tel',
    path: numero,
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Widget categorieIcon(String cat) {
  switch (cat) {
    // =========================
    // SANTÉ
    // =========================

    case 'Pharmacie':
      return const Icon(Icons.medication_rounded, color: Color(0xFF2E8B57));

    case 'Sante':
      return const Icon(Icons.local_hospital_rounded, color: Color(0xFFDE5B71));

    case 'Massages':
      return const Icon(Icons.spa_rounded, color: Color(0xFF9C6ADE));

    // =========================
    // ÉDUCATION
    // =========================

    case 'Ecole':
      return const Icon(Icons.school_rounded, color: Color(0xFF3F7FBF));
    case 'Education':
      return const Icon(Icons.school_rounded, color: Color(0xFF3F7FBF));

    case 'Universite':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF8C5BC4),
      );

    case 'Bibliotheques':
      return const Icon(Icons.local_library_rounded, color: Color(0xFF795548));
    case 'Lecture':
      return const Icon(Icons.local_library_rounded, color: Color(0xFF795548));
    // =========================
    // TRANSPORT / VOYAGE
    // =========================

    case 'Transport':
      return const Icon(Icons.directions_bus_rounded, color: Color(0xFF3D8D78));

    case 'Voyage':
      return const Icon(Icons.luggage_rounded, color: Color(0xFF00897B));

    case 'Aeroports':
      return const Icon(Icons.flight_rounded, color: Color(0xFF1976D2));

    // =========================
    // URGENCES / SÉCURITÉ
    // =========================

    case 'Sapeurs Pompiers':
      return const Icon(Icons.fire_truck_rounded, color: Color(0xFFE64A35));

    case 'Gendarmerie':
      return const Icon(Icons.local_police_rounded, color: Color(0xFF2457A6));

    case 'Commissariat':
      return const Icon(Icons.local_police_rounded, color: Color(0xFF1565C0));

    case 'Justice':
      return const Icon(Icons.gavel_rounded, color: Color(0xFF6D4C41));

    // =========================
    // ADMINISTRATION
    // =========================

    case 'Mairie':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF9D7545),
      );

    case 'Ministere':
      return const Icon(Icons.business_rounded, color: Color(0xFF00695C));

    case 'Impot':
      return const Icon(Icons.receipt_long_rounded, color: Color(0xFFB58335));

    case 'Etat Civile':
      return const Icon(Icons.badge_rounded, color: Color(0xFF00897B));

    // =========================
    // FINANCES
    // =========================

    case 'Banque':
      return const Icon(
        Icons.account_balance_wallet_rounded,
        color: Color(0xFF1976D2),
      );

    case 'Finance':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF1976D2),
      );

    case 'Logement':
      return const Icon(Icons.hotel_rounded, color: Color(0xFF8E44AD));

    case 'Restauration':
      return const Icon(Icons.restaurant_rounded, color: Color(0xFFE65100));

    case 'Services Publics':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF1565C0),
      );
      case 'Securite':
  return const Icon(
    Icons.shield_rounded,
    color: Color(0xFFD32F2F),
  );

    case 'Assurance':
      return const Icon(Icons.shield_rounded, color: Color(0xFF5E35B1));

    // =========================
    // LIVRAISON / COMMERCE
    // =========================

    case 'Services de Livraison':
      return const Icon(Icons.local_shipping_rounded, color: Color(0xFFFF6F00));

    case 'Marches':
      return const Icon(Icons.storefront_rounded, color: Color(0xFFE65100));

    case 'Super Marche':
      return const Icon(Icons.shopping_cart_rounded, color: Color(0xFF43A047));

    // =========================
    // RELIGION
    // =========================

    case 'Mosquee':
      return const Icon(Icons.mosque_rounded, color: Color(0xFF007A4D));

    case 'Eglise':
      return const Icon(Icons.church_rounded, color: Color(0xFF795548));

    // =========================
    // HÔTELLERIE / RESTAURATION
    // =========================

    case 'Hotel':
      return const Icon(Icons.hotel_rounded, color: Color(0xFF8E24AA));

    case 'Restaurant':
      return const Icon(Icons.restaurant_rounded, color: Color(0xFFE65100));

    // =========================
    // TOURISME / CULTURE
    // =========================

    case 'Monuments':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF795548),
      );

    case 'Humanitaire':
      return const Icon(
        Icons.volunteer_activism_rounded,
        color: Color(0xFFE53935),
      );
    case 'Culte et Religion':
      return const Icon(Icons.church_rounded, color: Color(0xFF6A1B9A));

    case 'Commercial':
      return const Icon(Icons.storefront_rounded, color: Color(0xFF00897B));
    case 'Cinema':
      return const Icon(Icons.movie_rounded, color: Color(0xFF7B1FA2));

    case 'Loisirs':
      return const Icon(Icons.sports_esports_rounded, color: Color(0xFFE91E63));
    // =========================
    // CARBURANT
    // =========================

    case 'Stations Services':
      return const Icon(
        Icons.local_gas_station_rounded,
        color: Color(0xFFD32F2F),
      );

    // =========================
    // ESPACES / LOISIRS
    // =========================

    case 'Espace Public':
      return const Icon(Icons.park_rounded, color: Color(0xFF43A047));

    case 'Salles de Jeux':
      return const Icon(Icons.sports_esports_rounded, color: Color(0xFF8E24AA));

    case 'Sport':
      return const Icon(Icons.sports_soccer_rounded, color: Color(0xFF00897B));

    // =========================
    // TECHNOLOGIE
    // =========================

    case 'Cybert':
      return const Icon(Icons.computer_rounded, color: Color(0xFF1565C0));

    // =========================
    // GÉOGRAPHIE
    // =========================

    case 'Quartiers':
      return const Icon(Icons.location_city_rounded, color: Color(0xFF00897B));

    case 'Villes':
      return const Icon(Icons.location_city_rounded, color: Color(0xFF1976D2));

    case 'Regions':
      return const Icon(Icons.map_rounded, color: Color(0xFF6A1B9A));

    // =========================
    // ORPHELINATS
    // =========================

    case 'Orphelinat':
      return const Icon(Icons.child_care_rounded, color: Color(0xFFFF8F00));

    // =========================
    // PAR DÉFAUT
    // =========================

    default:
      return const Icon(Icons.help_outline_rounded, color: Colors.grey);
  }
}
