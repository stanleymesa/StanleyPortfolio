class NavItem {
  final NavType navType;
  final String title;
  final bool isSelected;

  NavItem({
    required this.navType,
    required this.title,
    required this.isSelected,
  });

  NavItem copy({NavType? navType, String? title, bool? isSelected}) => NavItem(
        navType: navType ?? this.navType,
        title: title ?? this.title,
        isSelected: isSelected ?? this.isSelected,
      );
}

enum NavType { HOME, ABOUT, PROJECTS, JOURNEY }
