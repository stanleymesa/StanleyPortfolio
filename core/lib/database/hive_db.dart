import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveDB {
  static Future init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(HiveDB.appModeBox);
    await Hive.openBox<String>(HiveDB.displaySettingsBox);
  }

  // Boxes
  static final appModeBox = 'appMode';
  static final displaySettingsBox = 'displaySettings';
}
