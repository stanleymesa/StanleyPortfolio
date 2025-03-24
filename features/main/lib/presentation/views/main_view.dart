import 'package:core/ui/component/default_button_custom.dart';
import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/views/component/about_section.dart';
import 'package:main/presentation/views/component/home_section.dart';
import 'package:main/presentation/views/component/journey_section.dart';
import 'package:main/presentation/views/component/main_header.dart';
import 'package:main/presentation/views/component/project_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
      ProjectSection(),
      JourneySection(),
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
    return Column(
      children: [Text('Mobile')],
    );
  }
}


