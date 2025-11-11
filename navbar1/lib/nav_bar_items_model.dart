import 'package:flutter/material.dart';

class NavBarItemsModel {
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;

  NavBarItemsModel({
    required this.icon,
    required this.onPressed,
    this.label,
  });
}
