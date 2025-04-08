import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultBorderCard extends StatelessWidget {
  final Widget content;

  const DefaultBorderCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Get.theme.colorScheme.onSecondaryContainer.withOpacity(0.2),
        ),
      ),
      child: content,
    );
  }
}
