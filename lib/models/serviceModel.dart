import 'package:flutter/material.dart';

class Service {
  final String id;
  final String name;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String category;

  const Service({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.category,
  });
}
