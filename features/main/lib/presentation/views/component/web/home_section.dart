import 'package:core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/controllers/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  final MainController controller;

  const HomeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          /** Main Content */
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
            ),
            child: Row(
              children: [
                HomeNameSection(),
                HomeProfileSection(),
              ],
            ),
          ),
          /** Footer */
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              color: Get.theme.colorScheme.onPrimaryContainer,
              transform: Matrix4.rotationZ(-0.02),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              color: Get.theme.colorScheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Android Native',
                    style: Get.textTheme.labelLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimaryContainer),
                  ),
                  Icon(
                    Icons.stars_outlined,
                    color: Get.theme.colorScheme.onPrimaryContainer,
                  ),
                  Text(
                    'Flutter Mobile',
                    style: Get.textTheme.labelLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimaryContainer),
                  ),
                  Icon(
                    Icons.stars_outlined,
                    color: Get.theme.colorScheme.onPrimaryContainer,
                  ),
                  Text(
                    'Flutter Web',
                    style: Get.textTheme.labelLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 92,
            right: 16,
            child: Text(
              'v${AppConstants.APP_VERSION}',
              style: Get.textTheme.labelSmall?.copyWith(
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeNameSection extends StatelessWidget {
  const HomeNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello There!',
            style: Get.textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RichText(
            text: TextSpan(
              text: "I'm ",
              style: Get.textTheme.labelLarge?.copyWith(fontSize: 36),
              children: [
                TextSpan(
                  text: 'Stanley Mesa,',
                  style: Get.textTheme.bodyLarge?.copyWith(
                      fontSize: 36,
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
            style: Get.textTheme.labelLarge?.copyWith(fontSize: 36),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Experienced Mobile Developer with 2+ years in the field, focusing on Android and Flutter Development.",
            style: Get.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final Uri url =
                          Uri.parse('https://github.com/stanleymesa');
                      await launchUrl(url);
                    } catch (_) {}
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../../assets/images/img_github.webp',
                          width: 24,
                          color: Get.theme.colorScheme.primary,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'GitHub',
                          style: Get.textTheme.labelLarge
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
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final Uri url = Uri.parse(
                          'https://www.linkedin.com/in/stanleymesaariel/');
                      await launchUrl(url);
                    } catch (_) {}
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Get.theme.colorScheme.primary,
                          child: Text(
                            'in',
                            style: Get.textTheme.titleLarge?.copyWith(
                              color: Get.theme.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'LinkedIn',
                          style: Get.textTheme.labelLarge
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomeProfileSection extends StatelessWidget {
  const HomeProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.only(bottom: 72),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              height: MediaQuery.sizeOf(context).width * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.theme.colorScheme.tertiary,
              ),
              transform: Matrix4.translationValues(48, 0, 0),
            ),
            Image.asset(
              '../../assets/images/img_stanley.webp',
              width: MediaQuery.sizeOf(context).width,
            ),
          ],
        ),
      ),
    );
  }
}
