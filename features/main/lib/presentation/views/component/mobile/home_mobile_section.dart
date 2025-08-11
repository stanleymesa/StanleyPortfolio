import 'package:core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/controllers/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

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
            left: 16,
            right: 16,
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
              transform: Matrix4.rotationZ(-0.03),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 36,
              color: Get.theme.colorScheme.primaryContainer,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'v${AppConstants.APP_VERSION}',
                style: Get.textTheme.labelSmall?.copyWith(
                  color: Get.theme.colorScheme.onPrimaryContainer,
                ),
              ),
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
        RichText(
          text: TextSpan(
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.colorScheme.secondary,
            ),
            children: [
              TextSpan(
                text: "Android & Flutter Developer",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              TextSpan(
                text: " with strong experience in ",
              ),
              TextSpan(
                text: "Kotlin, Java, Jetpack Compose",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              TextSpan(
                text: ", and ",
              ),
              TextSpan(
                text: "Flutter",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              TextSpan(
                text:
                    ". Known for successfully modernizing legacy apps, refactoring major code, and improving performance. Passionate about writing clean, reusable code and delivering impactful mobile solutions.",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              final Uri url = Uri.parse('https://github.com/stanleymesa');
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
          onPressed: () async {
            try {
              final Uri url =
                  Uri.parse('https://www.linkedin.com/in/stanleymesaariel/');
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
            constraints: BoxConstraints(maxWidth: 280, maxHeight: 280),
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
