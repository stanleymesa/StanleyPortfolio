import 'package:flutter/material.dart';

class NavItem {
  final int index;
  final NavType navType;
  final String title;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;

  NavItem({
    required this.index,
    required this.navType,
    required this.title,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
  });

  NavItem copy({
    int? index,
    NavType? navType,
    String? title,
    IconData? icon,
    IconData? selectedIcon,
    bool? isSelected,
  }) =>
      NavItem(
        index: index ?? this.index,
        navType: navType ?? this.navType,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        selectedIcon: selectedIcon ?? this.selectedIcon,
        isSelected: isSelected ?? this.isSelected,
      );
}

enum NavType { HOME, ABOUT, PROJECTS, JOURNEY }

final defaultNavItems = [
  NavItem(
    index: 0,
    navType: NavType.HOME,
    title: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home_rounded,
    isSelected: true,
  ),
  NavItem(
    index: 1,
    navType: NavType.ABOUT,
    title: 'About',
    icon: Icons.person_outline_rounded,
    selectedIcon: Icons.person_rounded,
    isSelected: false,
  ),
  NavItem(
    index: 2,
    navType: NavType.PROJECTS,
    title: 'Projects',
    icon: Icons.code_rounded,
    selectedIcon: Icons.developer_mode_rounded,
    isSelected: false,
  ),
  NavItem(
    index: 3,
    navType: NavType.JOURNEY,
    title: 'Journey',
    icon: Icons.school_outlined,
    selectedIcon: Icons.school_rounded,
    isSelected: false,
  ),
];
