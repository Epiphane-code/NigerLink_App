import 'package:e_services_niger/models/emergency.dart';
import 'package:e_services_niger/models/place.dart';
import 'package:e_services_niger/models/serviceModel.dart';
import 'package:flutter/material.dart';


class AppController {
  static const green = Color(0xFF007A4D);
  static const orange = Color(0xFFFF6900);

  static const places = <Place>[
    Place(
      name: 'Pharmacie Nationale de Niamey',
      type: 'Pharmacie',
      address: 'Plateau, Niamey',
      phone: '20 73 20 20',
      distance: '1.2 km',
    ),
    Place(
      name: 'Pharmacie Terminus',
      type: 'Pharmacie',
      address: 'Terminus, Niamey',
      phone: '20 73 22 11',
      distance: '2.4 km',
    ),
    Place(
      name: 'Pharmacie El Fath',
      type: 'Pharmacie',
      address: 'Yantala, Niamey',
      phone: '20 35 10 10',
      distance: '3.1 km',
    ),
    Place(
      name: 'Hôpital National de Niamey',
      type: 'Centre de santé',
      address: 'Boulevard de la Nation',
      phone: '20 72 22 22',
      distance: '3.8 km',
    ),
    Place(
      name: 'Commissariat Central',
      type: 'Police',
      address: 'Centre-ville, Niamey',
      phone: '17',
      distance: '4.0 km',
    ),
  ];

}
