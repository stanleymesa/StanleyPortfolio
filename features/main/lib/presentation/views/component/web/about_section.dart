import 'package:core/ui/component/default_border_card.dart';
import 'package:core/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Get.theme.colorScheme.background,
              padding: EdgeInsets.only(top: 64,),
              child: AboutServiceSection(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Get.theme.colorScheme.primary,
              // padding: EdgeInsets.only(top: 32, bottom: 0),
              child: AboutMeSection(),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutServiceSection extends StatelessWidget {
  const AboutServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.1,
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
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: Get.theme.colorScheme.onBackground,
                  fontSize: 18,
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
              style: Get.textTheme.bodyLarge?.copyWith(
                color: Get.theme.colorScheme.tertiary,
                fontSize: 36,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: ' I Provide',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 36,
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
          Row(
            children: [
              ServiceContent(
                icon: Icons.android_rounded,
                title: 'Android Native',
                text:
                    'We build Android apps with Jetpack Compose to makes beautiful and smooth design, clean Architecture keeps the code organized, and Android Native tools for best performance.',
              ),
              SizedBox(
                width: 24,
              ),
              ServiceContent(
                icon: Icons.phone_android_rounded,
                title: 'Flutter Mobile',
                text:
                    'We create mobile apps with Flutter. GetX manages app data and navigation. Clean Architecture keeps the code organized. One code works on both Android and iOS.',
              ),
              SizedBox(
                width: 24,
              ),
              ServiceContent(
                icon: Icons.computer_rounded,
                title: 'Flutter Web',
                text:
                    'We use Flutter Web to make websites. GetX handles app data and pages. Clean Architecture keeps the code clean. One code works on all web browsers.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /** About Me Profile */
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.colorScheme.tertiaryContainer,
                  ),
                  transform: Matrix4.translationValues(0, 0, 0),
                ),
                Transform.flip(
                  flipX: true,
                  child: Image.asset(
                    '../../assets/images/img_stanley.webp',
                    width: MediaQuery.sizeOf(context).width * 0.3,
                  ),
                ),
              ],
            ),
          ),
          /** About Me Desc */
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      style: Get.textTheme.bodyLarge?.copyWith(
                        color: Get.theme.colorScheme.background,
                        fontSize: 18,
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
                    style: Get.textTheme.labelLarge?.copyWith(
                      color: Get.theme.colorScheme.background,
                      fontSize: 36,
                      fontStyle: FontStyle.normal,
                    ),
                    children: [
                      TextSpan(
                        text: ' Stanley Mesa?',
                        style: Get.textTheme.bodyLarge?.copyWith(
                          color: Get.theme.colorScheme.tertiaryContainer,
                          fontSize: 36,
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
                                color:
                                    Get.theme.colorScheme.onTertiaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Get.theme.colorScheme.tertiaryContainer,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final Uri url = Uri.parse(
                              'https://stanley.soapmate.id/assets/files/stanley_resume_v1.0.12.pdf');
                          await launchUrl(url);
                        } catch (_) {}
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Get.theme.colorScheme.tertiaryContainer,
                          foregroundColor:
                              Get.theme.colorScheme.onTertiaryContainer,
                          padding: EdgeInsets.symmetric(
                              horizontal: 3, vertical: 11)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              'See Resume',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ServiceContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const ServiceContent({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 240,
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
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
