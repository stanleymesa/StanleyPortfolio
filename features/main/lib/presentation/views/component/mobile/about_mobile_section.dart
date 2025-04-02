import 'package:core/ui/component/default_border_card.dart';
import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMobileSection extends StatelessWidget {
  const AboutMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Get.theme.colorScheme.background,
          padding: EdgeInsets.only(top: 32),
          child: AboutServiceMobileSection(),
        ),
        Container(
          color: Get.theme.colorScheme.primary,
          child: AboutMeMobileSection(),
        ),
      ],
    );
  }
}

class AboutServiceMobileSection extends StatelessWidget {
  const AboutServiceMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /** Service Title */
          Row(
            children: [
              Container(
                width: 12,
                height: 2,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.tertiary,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Services',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              text: 'Services',
              style: Get.textTheme.bodyMedium?.copyWith(
                color: Get.theme.colorScheme.tertiary,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: ' I Provide',
                  style: Get.textTheme.labelMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          /** Service Content */
          SizedBox(
            height: 24,
          ),
          Column(
            children: [
              ServiceMobileContent(
                icon: Icons.android_rounded,
                title: 'Android Native',
                text:
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
              ),
              SizedBox(
                height: 16,
              ),
              ServiceMobileContent(
                icon: Icons.phone_android_rounded,
                title: 'Flutter Mobile',
                text:
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
              ),
              SizedBox(
                height: 16,
              ),
              ServiceMobileContent(
                icon: Icons.computer_rounded,
                title: 'Flutter Web',
                text:
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
              ),
            ],
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class AboutMeMobileSection extends StatelessWidget {
  const AboutMeMobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 2,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.tertiaryContainer,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'About Me',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.background,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              text: 'Who is',
              style: Get.textTheme.labelMedium?.copyWith(
                color: Get.theme.colorScheme.background,
                fontSize: 24,
                fontStyle: FontStyle.normal,
              ),
              children: [
                TextSpan(
                  text: ' Stanley Mesa?',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.tertiaryContainer,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Stanley Mesa is a human who loves mobile development especially Android. But i also love flutter mobile and web development',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.onSecondary,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                foregroundColor: Get.theme.colorScheme.onTertiaryContainer,
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 11)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    'Download CV',
                    style: Get.textTheme.labelSmall?.copyWith(
                      color: Get.theme.colorScheme.background,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Get.theme.colorScheme.tertiary,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Get.theme.colorScheme.tertiaryContainer,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceMobileContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const ServiceMobileContent({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultBorderCard(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Get.theme.colorScheme.background,
            child: Icon(
              icon,
              size: 24,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: Get.textTheme.labelLarge?.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.colorScheme.secondary,
              fontSize: context.isMobile() ? 12 : 14
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
