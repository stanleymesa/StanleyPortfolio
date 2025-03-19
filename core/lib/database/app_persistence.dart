import 'package:core/database/hive_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../shared_data/enum/app_mode.dart';
import '../shared_data/enum/display_settings.dart';

class AppPersistence {
  final _appModeBox = Hive.box<String>(HiveDB.appModeBox);
  final _displaySettingsBox = Hive.box<String>(HiveDB.displaySettingsBox);

  // App Mode
  setAppMode(String appMode) => _appModeBox.put(0, appMode);

  AppMode getAppMode() =>
      (_appModeBox.get(0, defaultValue: AppMode.DARK.name) ?? AppMode.DARK.name)
          .toAppMode();

  // Display Settings
  setDisplaySettings(DisplaySettings displaySettings) =>
      _displaySettingsBox.put(0, displaySettings.type.name);

  DisplaySettings getDisplaySettings() => (_displaySettingsBox.get(0,
              defaultValue: DisplaySettings.Auto().type.name) ??
          DisplaySettings.Auto().type.name)
      .toDisplaySettings();
}
