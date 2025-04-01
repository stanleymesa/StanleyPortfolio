class NavItem {
  final NavType navType;
  final String title;
  final bool isSelected;

  NavItem({
    required this.navType,
    required this.title,
    required this.isSelected,
  });
}

enum NavType { HOME, ABOUT, PROJECTS, JOURNEY }
