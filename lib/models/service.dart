import 'package:e_services_niger/utilities/utils.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final int idVal;
  final String categorieVal;
  final String sousCategorieVal;
  final String aproposVal;
  final int? gestionnaireIdVal;
  final int horaireIdVal;
  final String nomserviceVal;
  final int addressIdVal;
  final String telephoneVal;
  final int coordonneeIdVal;
  final bool gardeVal;
  final String statutActuelVal;
  late Widget? icon;
  ServiceModel({
    required this.idVal,
    required this.categorieVal,
    required this.sousCategorieVal,
    required this.aproposVal,
    this.gestionnaireIdVal,
    required this.horaireIdVal,
    required this.nomserviceVal,
    required this.addressIdVal,
    required this.telephoneVal,
    required this.coordonneeIdVal,
    required this.gardeVal,
    required this.statutActuelVal,
    this.icon,

  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      idVal: map['idVal'],
      categorieVal: map['categorieVal'],
      sousCategorieVal: map['sousCategorieVal'],
      aproposVal: map['aproposVal'],
      gestionnaireIdVal: map['gestionnaireIdVal'],
      horaireIdVal: map['horaireIdVal'],
      nomserviceVal: map['nomserviceVal'],
      addressIdVal: map['addressIdVal'],
      telephoneVal: map['telephoneVal'],
      coordonneeIdVal: map['coordonneeIdVal'],
      gardeVal: map['gardeVal'],
      statutActuelVal: map['statutActuelVal'],
      icon: categorieIcon(map['sousCategorieVal'])
    );
  }
}
