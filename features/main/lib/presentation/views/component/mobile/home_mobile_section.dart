import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/controllers/main_controller.dart';

class HomeMobileSection extends StatelessWidget {
  final MainController controller;

  const HomeMobileSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          /** Name */
          Positioned(
            top: 0,
            bottom: MediaQuery.sizeOf(context).height * 0.4,
            left: 24,
            right: 24,
            child: HomeNameMobileSection(),
          ),
          /** Photo */
          Positioned(
            bottom: 0,
            child: HomeProfileMobileSection(),
          ),
          /** Footer */
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 36,
              color: Get.theme.colorScheme.onPrimaryContainer,
              transform: Matrix4.rotationZ(-0.05),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 36,
              color: Get.theme.colorScheme.primaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeNameMobileSection extends StatelessWidget {
  const HomeNameMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello There!',
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            text: "I'm ",
            style: Get.textTheme.labelLarge?.copyWith(fontSize: 24),
            children: [
              TextSpan(
                text: 'Stanley Mesa,',
                style: Get.textTheme.bodyLarge?.copyWith(
                    fontSize: 24,
                    color: Get.theme.colorScheme.tertiary,
                    decoration: TextDecoration.underline,
                    decorationColor: Get.theme.colorScheme.tertiary,
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
        Text(
          'Mobile Developer.',
          style: Get.textTheme.labelLarge?.copyWith(fontSize: 24),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Experienced Mobile Developer with 2+ years in the field, focusing on Android and Flutter Development.",
          style: Get.textTheme.bodySmall?.copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  '../../assets/images/img_github.webp',
                  width: 20,
                  color: Get.theme.colorScheme.primary,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'GitHub',
                  style: Get.textTheme.labelMedium
                      ?.copyWith(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.colorScheme.background,
            side: BorderSide(color: Get.theme.colorScheme.primary),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Get.theme.colorScheme.primary,
                  child: Text(
                    'in',
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: Get.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'LinkedIn',
                  style: Get.textTheme.labelMedium
                      ?.copyWith(color: Get.theme.colorScheme.primary),
                ),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.colorScheme.background,
            side: BorderSide(color: Get.theme.colorScheme.primary),
          ),
        )
      ],
    );
  }
}

class HomeProfileMobileSection extends StatelessWidget {
  const HomeProfileMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).width * 0.6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.colorScheme.tertiary,
            ),
            transform: Matrix4.translationValues(16, 0, 0),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Image.asset(
              '../../assets/images/img_stanley.webp',
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
