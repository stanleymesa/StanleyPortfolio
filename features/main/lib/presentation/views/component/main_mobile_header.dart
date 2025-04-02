import 'package:animated_visibility/animated_visibility.dart';
import 'package:core/database/hive_db.dart';
import 'package:core/shared_data/enum/app_mode.dart';
import 'package:core/ui/component/default_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main/presentation/controllers/main_controller.dart';

class MainMobileHeader extends StatelessWidget {
  final MainController controller;

  const MainMobileHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedVisibility(
        visible: controller.isShowMobileHeader.value,
        enter: fadeIn() + slideInHorizontally(),
        exit: fadeOut() + slideOutHorizontally(),
        enterDuration: Duration(milliseconds: 250),
        exitDuration: Duration(milliseconds: 250),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(36)),
              border: Border.all(color: Get.theme.colorScheme.background),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                ...List.generate(
                  controller.navItems.length,
                  (index) {
                    final navItem = controller.navItems[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < controller.navItems.length - 1 ? 16 : 0,
                      ),
                      child: DefaultButtonCustom(
                        appMode: controller.appPersistence.getAppMode(),
                        radiusSplash: 8,
                        content: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Icon(
                            navItem.isSelected
                                ? navItem.selectedIcon
                                : navItem.icon,
                            color: navItem.isSelected
                                ? Get.theme.colorScheme.tertiaryContainer
                                : Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                        onClick: () => controller.scrollTo(navItem.navType),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ValueListenableBuilder(
                  valueListenable:
                      Hive.box<String>(HiveDB.appModeBox).listenable(),
                  builder: (context, box, child) {
                    var currentAppMode = controller.appPersistence.getAppMode();
                    return Switch(
                      value: currentAppMode == AppMode.DARK,
                      trackColor: MaterialStateProperty.all(
                        Get.theme.colorScheme.tertiaryContainer,
                      ),
                      thumbColor: MaterialStateProperty.all(
                        Get.theme.colorScheme.onTertiaryContainer,
                      ),
                      onChanged: (value) {
                        controller.appPersistence.setAppMode(
                            (value) ? AppMode.DARK.name : AppMode.LIGHT.name);
                      },
                      thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Icon(
                              Icons.dark_mode_outlined,
                              color: Get.theme.colorScheme.tertiaryContainer,
                            );
                          }
                          return Icon(
                            Icons.light_mode_outlined,
                            color: Get.theme.colorScheme.tertiaryContainer,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
