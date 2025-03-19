enum AppMode { LIGHT, DARK }

extension StringToAppMode on String {
  AppMode toAppMode() {
    if (this == AppMode.LIGHT.name) {
      return AppMode.LIGHT;
    } else {
      return AppMode.DARK;
    }
  }
}
