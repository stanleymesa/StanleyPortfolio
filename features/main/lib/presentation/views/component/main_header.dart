import 'package:animated_visibility/animated_visibility.dart';
import 'package:core/database/hive_db.dart';
import 'package:core/shared_data/enum/app_mode.dart';
import 'package:core/ui/component/default_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main/presentation/controllers/main_controller.dart';

class MainHeader extends StatelessWidget {
  final MainController controller;

  const MainHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedVisibility(
        visible: controller.isShowHeader.value,
        enter: fadeIn() + expandVertically(),
        exit: fadeOut() + shrinkVertically(),
        enterDuration: Duration(milliseconds: 250),
        exitDuration: Duration(milliseconds: 250),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.15,
            vertical: 32,
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(36)),
              border: Border.all(color: Get.theme.colorScheme.background),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                      child: Image.asset(
                        '../../assets/images/img_stanley_logo.webp',
                        width: 24,
                        color: Get.theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Stanley',
                      style: Get.textTheme.labelLarge?.copyWith(
                          fontSize: 18, color: Get.theme.colorScheme.onPrimary),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Home',
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Get.theme.colorScheme.onTertiary,
                            decoration: TextDecoration.underline,
                            decorationColor: Get.theme.colorScheme.onTertiary,
                          ),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'About',
                          style: Get.textTheme.bodyMedium?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Projects',
                          style: Get.textTheme.bodyMedium?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Journey',
                          style: Get.textTheme.bodyMedium?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 0,
                    ),
                  ],
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
