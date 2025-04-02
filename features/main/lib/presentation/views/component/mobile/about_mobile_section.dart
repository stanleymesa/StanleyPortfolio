import 'package:core/ui/component/default_border_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              padding: EdgeInsets.only(top: 72),
              child: AboutServiceSection(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Get.theme.colorScheme.primary,
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
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
              ),
              SizedBox(
                width: 24,
              ),
              ServiceContent(
                icon: Icons.phone_android_rounded,
                title: 'Flutter Mobile',
                text:
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
              ),
              SizedBox(
                width: 24,
              ),
              ServiceContent(
                icon: Icons.computer_rounded,
                title: 'Flutter Web',
                text:
                    'Developing Android Apps with Jetpack Compose and Clean Architecture',
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
                  width: MediaQuery.sizeOf(context).width * 0.325,
                  height: MediaQuery.sizeOf(context).width * 0.325,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.colorScheme.tertiaryContainer,
                  ),
                  transform: Matrix4.translationValues(16, 0, 0),
                ),
                Image.asset(
                  '../../assets/images/img_stanley.webp',
                  width: MediaQuery.sizeOf(context).width * 0.3,
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
                      foregroundColor:
                          Get.theme.colorScheme.onTertiaryContainer,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 11)),
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
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
