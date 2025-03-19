import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile();

    return Scaffold(
      backgroundColor: context.isMobile()
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.background,
      body: isMobile
          ? MainMobile(controller: controller)
          : MainWeb(controller: controller),
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

class MainWeb extends StatelessWidget {
  final MainController controller;

  const MainWeb({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Web')],
    );
  }
}
