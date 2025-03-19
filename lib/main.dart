import 'package:core/database/hive_db.dart';
import 'package:core/di/locator.dart';
import 'package:core/routes/app_pages.dart';
import 'package:core/routes/app_routes.dart';
import 'package:core/shared_data/enum/app_mode.dart';
import 'package:core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setUpLocator();
  await HiveDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<String>(HiveDB.appModeBox).listenable(),
      builder: (context, box, child) {
        var currentAppMode =
            (box.get(0, defaultValue: AppMode.DARK.name) ?? AppMode.DARK.name)
                .toAppMode();

        return GetMaterialApp(
          initialRoute: Routes.main,
          getPages: AppPages.routes,
          title: "Stanley's Portfolio",
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: (currentAppMode == AppMode.LIGHT)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
