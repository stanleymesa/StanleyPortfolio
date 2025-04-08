class DisplaySettings {
  final DisplaySettingsType type;
  final String name;

  DisplaySettings._({required this.type, required this.name});

  factory DisplaySettings.Auto() => DisplaySettings._(
        type: DisplaySettingsType.AUTO,
        name: 'Auto (responsive)',
      );

  factory DisplaySettings.Desktop() => DisplaySettings._(
        type: DisplaySettingsType.DESKTOP,
        name: 'Desktop (for large screen)',
      );

  factory DisplaySettings.Mobile() => DisplaySettings._(
        type: DisplaySettingsType.MOBILE,
        name: 'Mobile (for small screen)',
      );
}

enum DisplaySettingsType { AUTO, DESKTOP, MOBILE }

extension DisplaySettingsMapper on String? {
  DisplaySettings toDisplaySettings() {
    if (this == DisplaySettings.Auto().type.name) {
      return DisplaySettings.Auto();
    } else if (this == DisplaySettings.Desktop().type.name) {
      return DisplaySettings.Desktop();
    } else if (this == DisplaySettings.Mobile().type.name) {
      return DisplaySettings.Mobile();
    } else {
      return DisplaySettings.Auto();
    }
  }
}
