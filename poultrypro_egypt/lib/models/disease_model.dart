import 'package:flutter/material.dart';

// Disease Model
class Disease {
  final String id;
  final String name;
  final String arabicName;
  final String emoji;
  final Color color;
  final String scientificName;
  final String family;
  final String genome;
  final String description;
  final List<String> symptoms;
  final List<String> causes;
  final List<String> prevention;
  final List<String> treatment;
  final String severity; // Critical, High, Medium, Low
  final List<String> affectedAges;
  final List<String> affectedSpecies;

  Disease({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.emoji,
    required this.color,
    required this.scientificName,
    required this.family,
    required this.genome,
    required this.description,
    required this.symptoms,
    required this.causes,
    required this.prevention,
    required this.treatment,
    required this.severity,
    required this.affectedAges,
    required this.affectedSpecies,
  });
}

// Vaccine Model
class Vaccine {
  final String name;
  final String arabicName;
  final String type;
  final String route;
  final int ageDay;
  final String diseases;
  final String color;

  Vaccine({
    required this.name,
    required this.arabicName,
    required this.type,
    required this.route,
    required this.ageDay,
    required this.diseases,
    required this.color,
  });
}

// Menu Item Model
class MenuItemModel {
  final String id;
  final String title;
  final String arabicTitle;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String? badge;

  MenuItemModel({
    required this.id,
    required this.title,
    required this.arabicTitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    this.badge,
  });
}

// Biosecurity Tip Model
class BiosecurityTip {
  final String title;
  final String arabicTitle;
  final String description;
  final IconData icon;
  final Color color;

  BiosecurityTip({
    required this.title,
    required this.arabicTitle,
    required this.description,
    required this.icon,
    required this.color,
  });
}
