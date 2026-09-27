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

    case 'pharmacie':
      return const Icon(Icons.medication_rounded, color: Color(0xFF2E8B57));

    case 'sante':
      return const Icon(Icons.local_hospital_rounded, color: Color(0xFFDE5B71));

    case 'massages':
      return const Icon(Icons.spa_rounded, color: Color(0xFF9C6ADE));

    // =========================
    // ÉDUCATION
    // =========================

    case 'ecole':
      return const Icon(Icons.school_rounded, color: Color(0xFF3F7FBF));
    case 'education':
      return const Icon(Icons.school_rounded, color: Color(0xFF3F7FBF));

    case 'universite':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF8C5BC4),
      );

    case 'bibliotheques':
      return const Icon(Icons.local_library_rounded, color: Color(0xFF795548));
    case 'lecture':
      return const Icon(Icons.local_library_rounded, color: Color(0xFF795548));
    // =========================
    // TRANSPORT / VOYAGE
    // =========================

    case 'transport':
      return const Icon(Icons.directions_bus_rounded, color: Color(0xFF3D8D78));

    case 'voyage':
      return const Icon(Icons.luggage_rounded, color: Color(0xFF00897B));

    case 'aeroports':
      return const Icon(Icons.flight_rounded, color: Color(0xFF1976D2));

    // =========================
    // URGENCES / SÉCURITÉ
    // =========================

    case 'sapeurs pompiers':
      return const Icon(Icons.fire_truck_rounded, color: Color(0xFFE64A35));

    case 'gendarmerie':
      return const Icon(Icons.local_police_rounded, color: Color(0xFF2457A6));

    case 'commissariat':
      return const Icon(Icons.local_police_rounded, color: Color(0xFF1565C0));

    case 'justice':
      return const Icon(Icons.gavel_rounded, color: Color(0xFF6D4C41));

    // =========================
    // ADMINISTRATION
    // =========================

    case 'mairie':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF9D7545),
      );

    case 'ministere':
      return const Icon(Icons.business_rounded, color: Color(0xFF00695C));

    case 'impot':
      return const Icon(Icons.receipt_long_rounded, color: Color(0xFFB58335));

    case 'etat civile':
      return const Icon(Icons.badge_rounded, color: Color(0xFF00897B));

    // =========================
    // FINANCES
    // =========================

    case 'banque':
      return const Icon(
        Icons.account_balance_wallet_rounded,
        color: Color(0xFF1976D2),
      );

    case 'finance':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF1976D2),
      );

    case 'logement':
      return const Icon(Icons.hotel_rounded, color: Color(0xFF8E44AD));

    case 'restauration':
      return const Icon(Icons.restaurant_rounded, color: Color(0xFFE65100));

    case 'services publics':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF1565C0),
      );
      case 'securite':
  return const Icon(
    Icons.shield_rounded,
    color: Color(0xFFD32F2F),
  );

    case 'assurance':
      return const Icon(Icons.shield_rounded, color: Color(0xFF5E35B1));

    // =========================
    // LIVRAISON / COMMERCE
    // =========================

    case 'services de livraison':
      return const Icon(Icons.local_shipping_rounded, color: Color(0xFFFF6F00));

    case 'marche':
      return const Icon(Icons.storefront_rounded, color: Color(0xFFE65100));

    case 'super marche':
      return const Icon(Icons.shopping_cart_rounded, color: Color(0xFF43A047));

    // =========================
    // RELIGION
    // =========================

    case 'mosquee':
      return const Icon(Icons.mosque_rounded, color: Color(0xFF007A4D));

    case 'eglise':
      return const Icon(Icons.church_rounded, color: Color(0xFF795548));

    // =========================
    // HÔTELLERIE / RESTAURATION
    // =========================

    case 'hotel':
      return const Icon(Icons.hotel_rounded, color: Color(0xFF8E24AA));

    case 'restaurant':
      return const Icon(Icons.restaurant_rounded, color: Color(0xFFE65100));

    // =========================
    // TOURISME / CULTURE
    // =========================

    case 'monument':
      return const Icon(
        Icons.account_balance_rounded,
        color: Color(0xFF795548),
      );

    case 'humanitaire':
      return const Icon(
        Icons.volunteer_activism_rounded,
        color: Color(0xFFE53935),
      );
    case 'culte et religion':
      return const Icon(Icons.church_rounded, color: Color(0xFF6A1B9A));

    case 'commercial':
      return const Icon(Icons.storefront_rounded, color: Color(0xFF00897B));
    case 'cinema':
      return const Icon(Icons.movie_rounded, color: Color(0xFF7B1FA2));

    case 'loisirs':
      return const Icon(Icons.sports_esports_rounded, color: Color(0xFFE91E63));
    // =========================
    // CARBURANT
    // =========================

    case 'stations services':
      return const Icon(
        Icons.local_gas_station_rounded,
        color: Color(0xFFD32F2F),
      );

    // =========================
    // ESPACES / LOISIRS
    // =========================

    case 'espace public':
      return const Icon(Icons.park_rounded, color: Color(0xFF43A047));

    case 'salles de jeux':
      return const Icon(Icons.sports_esports_rounded, color: Color(0xFF8E24AA));

    case 'sport':
      return const Icon(Icons.sports_soccer_rounded, color: Color(0xFF00897B));

    // =========================
    // TECHNOLOGIE
    // =========================

    case 'cybert':
      return const Icon(Icons.computer_rounded, color: Color(0xFF1565C0));

    // =========================
    // GÉOGRAPHIE
    // =========================

    case 'quartier':
      return const Icon(Icons.location_city_rounded, color: Color(0xFF00897B));

    case 'ville':
      return const Icon(Icons.location_city_rounded, color: Color(0xFF1976D2));

    case 'region':
      return const Icon(Icons.map_rounded, color: Color(0xFF6A1B9A));

    // =========================
    // ORPHELINATS
    // =========================

    case 'orphelinat':
      return const Icon(Icons.child_care_rounded, color: Color(0xFFFF8F00));

    // =========================
    // PAR DÉFAUT
    // =========================

    default:
      return const Icon(Icons.help_outline_rounded, color: Colors.grey);
  }
}
