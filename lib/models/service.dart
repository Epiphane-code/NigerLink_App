import 'package:e_services_niger/utilities/utils.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final int idVal;
  final String categorieVal;
  final String sousCategorieVal;
  final String aproposVal;
  final int? gestionnaireIdVal;
  final List horaire;
  final String nomserviceVal;
  final int addressIdVal;
  final String telephoneVal;
  final int coordonneeIdVal;
  final bool gardeVal;
  final String statutActuelVal;
  final String urlImageVal;
  late Widget? icon;
  ServiceModel({
    required this.idVal,
    required this.categorieVal,
    required this.sousCategorieVal,
    required this.aproposVal,
    this.gestionnaireIdVal,
    required this.horaire,
    required this.nomserviceVal,
    required this.addressIdVal,
    required this.telephoneVal,
    required this.coordonneeIdVal,
    required this.gardeVal,
    required this.statutActuelVal,
    required this.urlImageVal,
    this.icon,

  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      idVal: map['idVal'],
      categorieVal: map['categorieVal'],
      sousCategorieVal: map['sousCategorieVal'],
      aproposVal: map['aproposVal'],
      gestionnaireIdVal: map['gestionnaireIdVal'],
      horaire: map['horaire'].split(' '),
      nomserviceVal: map['nomserviceVal'],
      addressIdVal: map['addressIdVal'],
      telephoneVal: map['telephoneVal'],
      coordonneeIdVal: map['coordonneeIdVal'],
      gardeVal: map['gardeVal'],
      statutActuelVal: map['statutActuelVal'],
      urlImageVal: map['urlImageVal'],
      icon: categorieIcon(map['sousCategorieVal'])
    );
  }


  Map<String,dynamic> toMap(){
    return {
      'idVal': idVal,
      'categorieVal' : categorieVal,
      'sousCategorieVal': sousCategorieVal,
      'aproposVal': aproposVal,
      'gestionnaireIdVal': gestionnaireIdVal,
      'horaire': horaire,
      'nomserviceVal': nomserviceVal,
      'addressIdVal': addressIdVal,
      'telephoneVal': telephoneVal,
      'coordonneeIdVal': coordonneeIdVal,
      'gardeVal': gardeVal,
      'statutActuelVal': statutActuelVal,
      'urlImageVal': urlImageVal,
    };
  }
}
