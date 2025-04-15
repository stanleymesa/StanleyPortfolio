import 'package:core/ui/component/default_border_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 128,
          ),
          /** Journey Title */
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                'Education & Work',
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
              text: 'My',
              style: Get.textTheme.labelLarge?.copyWith(
                color: Get.theme.colorScheme.onBackground,
                fontSize: 36,
                fontStyle: FontStyle.normal,
              ),
              children: [
                TextSpan(
                  text: ' Academic and Professional',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.colorScheme.tertiary,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: ' Journey',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 36,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          /** Journey */
          SizedBox(
            height: 32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: JourneyEducationSection(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: JourneyLicenseSection(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: JourneyWorkSection(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class JourneyEducationSection extends StatelessWidget {
  const JourneyEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBorderCard(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Get.theme.colorScheme.primary,
                child: Icon(
                  Icons.school_outlined,
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Education',
                style: Get.textTheme.labelLarge?.copyWith(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: Get.theme.colorScheme.onSecondaryContainer.withOpacity(0.2),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dian Nuswantoro University',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Bachelor of Computer Science',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '2019-2023',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'GPA 3.95',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
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

class JourneyLicenseSection extends StatelessWidget {
  const JourneyLicenseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBorderCard(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Get.theme.colorScheme.primary,
                child: Icon(
                  Icons.workspace_premium_outlined,
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Licenses & Certifications',
                style: Get.textTheme.labelLarge?.copyWith(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: Get.theme.colorScheme.onSecondaryContainer.withOpacity(0.2),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Associate Android Developer',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Google',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Android Developer Expert',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Dicoding Indonesia',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Intermediate',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'ITBOX',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JourneyWorkSection extends StatelessWidget {
  const JourneyWorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBorderCard(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Get.theme.colorScheme.primary,
                child: Icon(
                  Icons.work_outline_outlined,
                  color: Get.theme.colorScheme.onPrimary,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Work Experience',
                style: Get.textTheme.labelLarge?.copyWith(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: Get.theme.colorScheme.onSecondaryContainer.withOpacity(0.2),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Android Developer',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Visi Prima Nusantara • Full-Time',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Apr 2023 - Present',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Android & Flutter Developer',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Freelance',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Nov 2023 - Present',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Developer',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Citiasia Inc • Internship',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Aug 2022 - Dec 2022',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Get.theme.colorScheme.onSecondaryContainer
                      .withOpacity(0.2),
                  width: 4,
                ),
              ),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Android Development Cohort',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Bangkit Academy led by Google, Tokopedia, Gojek, & Traveloka',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Feb 2022 - Aug 2022',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
