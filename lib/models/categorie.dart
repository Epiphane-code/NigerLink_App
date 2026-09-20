import 'package:e_services_niger/utilities/utils.dart';
import 'package:flutter/material.dart';


class CategorieModel {
  final int idVal;
  final String categorieVal;
  final String description;
  late Widget icon;
  CategorieModel({
    required this.idVal,
    required this.categorieVal,
    required this.description,
    required this.icon,
  });



  factory CategorieModel.fromMap(Map<String, dynamic> map) {
    return CategorieModel(
      idVal: map['idVal'],
      categorieVal: map['categorieVal'],
      description: map['description'],
      icon: categorieIcon(map['categorieVal']),
    );
  }
}
