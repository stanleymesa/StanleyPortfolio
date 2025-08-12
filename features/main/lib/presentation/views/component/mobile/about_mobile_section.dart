import 'package:core/ui/component/default_border_card.dart';
import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
        horizontal: 16,
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
                    'We build Android apps with Jetpack Compose to makes beautiful and smooth design, clean Architecture keeps the code organized, and Android Native tools for best performance.',
              ),
              SizedBox(
                height: 16,
              ),
              ServiceMobileContent(
                icon: Icons.phone_android_rounded,
                title: 'Flutter Mobile',
                text:
                    'We create mobile apps with Flutter. GetX manages app data and navigation. Clean Architecture keeps the code organized. One code works on both Android and iOS.',
              ),
              SizedBox(
                height: 16,
              ),
              ServiceMobileContent(
                icon: Icons.computer_rounded,
                title: 'Flutter Web',
                text:
                    'We use Flutter Web to make websites. GetX handles app data and pages. Clean Architecture keeps the code clean. One code works on all web browsers.',
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
        horizontal: 16,
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
            "Hi there! I love building apps and websites! I've spent time working on Android apps, and I'm also really into Flutter, which lets me make cool mobile apps and even websites. It's been a fun journey learning how to create things that people enjoy using.",
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.onSecondary,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: 'stanleymesa2001@gmail.com'),
                  );
                  showSnackbar('Email copied');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Get.theme.colorScheme.onTertiaryContainer,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Email',
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: Get.theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final Uri url = Uri.parse(
                        'https://stanley.soapmate.id/assets/files/stanley_resume_v1.0.13.pdf');
                    await launchUrl(url);
                  } catch (_) {}
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'See Resume',
                        style: Get.textTheme.labelSmall?.copyWith(
                          color: Get.theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Get.theme.colorScheme.onTertiaryContainer,
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.colorScheme.tertiaryContainer,
                ),
              ),
            ],
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
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 224,
      child: DefaultBorderCard(
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
                  fontSize: context.isMobile() ? 12 : 14),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
