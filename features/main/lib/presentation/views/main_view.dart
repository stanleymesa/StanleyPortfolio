import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/views/component/main_header.dart';
import 'package:main/presentation/views/component/main_mobile_header.dart';
import 'package:main/presentation/views/component/mobile/about_mobile_section.dart';
import 'package:main/presentation/views/component/mobile/home_mobile_section.dart';
import 'package:main/presentation/views/component/mobile/project_mobile_section.dart';
import 'package:main/presentation/views/component/web/about_section.dart';
import 'package:main/presentation/views/component/web/home_section.dart';
import 'package:main/presentation/views/component/web/journey_section.dart';
import 'package:main/presentation/views/component/web/project_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../controllers/main_controller.dart';
import 'component/mobile/journey_mobile_section.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: isMobile
          ? Padding(
              padding: EdgeInsets.only(right: 6),
              child: Obx(
                () => AnimatedRotation(
                  turns: controller.isShowMobileHeader.value ? 0.5 : 0,
                  duration: Duration(milliseconds: 250),
                  child: FloatingActionButton(
                    onPressed: () => controller.toggleShowMobileHeader(),
                    backgroundColor: Get.theme.colorScheme.tertiary,
                    child: Icon(
                      Icons.menu_open_rounded,
                      color: Get.theme.colorScheme.onTertiary,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: isMobile
          ? MainMobile(controller: controller)
          : MainWeb(controller: controller),
    );
  }
}

class MainWeb extends StatelessWidget {
  final MainController controller;

  MainWeb({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final sections = [
      HomeSection(
        controller: controller,
      ),
      AboutSection(),
      JourneySection(),
      ProjectSection(
        controller: controller,
      ),
    ];

    return Stack(
      children: [
        /** Sections */
        ScrollablePositionedList.builder(
          itemCount: sections.length,
          itemScrollController: controller.scrollController,
          itemPositionsListener: controller.itemPositionsListener,
          itemBuilder: (context, index) => sections[index],
        ),
        /** Header */
        MainHeader(controller: controller)
      ],
    );
  }
}

class MainMobile extends StatelessWidget {
  final MainController controller;

  const MainMobile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final sections = [
      HomeMobileSection(
        controller: controller,
      ),
      AboutMobileSection(),
      JourneyMobileSection(),
      ProjectMobileSection(
        controller: controller,
      ),
    ];

    return Stack(
      children: [
        /** Sections */
        ScrollablePositionedList.builder(
          itemCount: sections.length,
          itemScrollController: controller.scrollController,
          itemPositionsListener: controller.itemPositionsListener,
          itemBuilder: (context, index) => sections[index],
        ),
        /** Side Header */
        Positioned(
          bottom: 64,
          right: 0,
          child: MainMobileHeader(controller: controller),
        ),
      ],
    );
  }
}
