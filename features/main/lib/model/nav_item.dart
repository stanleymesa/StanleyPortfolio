import 'package:flutter/material.dart';

class NavItem {
  final NavType navType;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;

  NavItem({
    required this.navType,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
  });

  NavItem copy({
    NavType? navType,
    String? title,
    IconData? icon,
    IconData? selectedIcon,
    bool? isSelected,
  }) =>
      NavItem(
        navType: navType ?? this.navType,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        selectedIcon: selectedIcon ?? this.selectedIcon,
        isSelected: isSelected ?? this.isSelected,
      );
}

enum NavType { HOME, ABOUT, PROJECTS, JOURNEY }
