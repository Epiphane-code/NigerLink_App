import 'package:flutter/material.dart';

class ESsearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const ESsearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Rechercher un service, un lieu...',
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        prefixIcon: const Icon(Icons.search_rounded, size: 20),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  onChanged?.call('');
                },
                icon: const Icon(Icons.close_rounded, size: 18),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
