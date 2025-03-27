import 'package:animated_visibility/animated_visibility.dart';
import 'package:core/ui/component/default_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                      child: Text(
                        'S',
                        style: Get.textTheme.labelLarge?.copyWith(
                            fontSize: 18, color: Get.theme.colorScheme.tertiary),
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
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Projects',
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    DefaultButtonCustom(
                      appMode: controller.appPersistence.getAppMode(),
                      radiusSplash: 8,
                      content: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Journey',
                          style: TextStyle(
                            color: Get.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 0,
                    ),
                  ],
                ),
                Switch(
                  value: true,
                  trackColor: MaterialStateProperty.all(
                      Get.theme.colorScheme.tertiaryContainer),
                  thumbColor:
                      MaterialStateProperty.all(Get.theme.colorScheme.tertiary),
                  onChanged: (value) {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
