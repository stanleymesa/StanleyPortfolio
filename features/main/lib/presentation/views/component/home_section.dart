import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/presentation/controllers/main_controller.dart';

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
            padding: EdgeInsets.fromLTRB(
              MediaQuery.sizeOf(context).width * 0.1,
              0,
              MediaQuery.sizeOf(context).width * 0.1,
              0,
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
              color: Get.theme.colorScheme.tertiary,
              transform: Matrix4.rotationZ(-0.02),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 56,
              color: Get.theme.colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Android Native',
                    style: Get.textTheme.titleLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimary, fontSize: 18),
                  ),
                  Icon(Icons.stars_outlined, color: Get.theme.colorScheme.onPrimary,),
                  Text(
                    'Flutter Mobile',
                    style: Get.textTheme.titleLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimary, fontSize: 18),
                  ),
                  Icon(Icons.stars_outlined, color: Get.theme.colorScheme.onPrimary,),
                  Text(
                    'Flutter Web',
                    style: Get.textTheme.titleLarge?.copyWith(
                        color: Get.theme.colorScheme.onPrimary, fontSize: 18),
                  ),
                ],
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
                fontSize: 22, color: Get.theme.colorScheme.secondary),
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
            "I'm an experienced Mobile Developer with 2+ years in the field, focusing on Android and Flutter Development.",
            style: Get.textTheme.bodyLarge?.copyWith(
                fontSize: 16, color: Get.theme.colorScheme.secondary),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          '../../assets/images/img_github.webp',
                          width: 24,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'GitHub',
                          style: Get.textTheme.labelLarge?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.colorScheme.primary,
                    foregroundColor: Get.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
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
                              color: Get.theme.colorScheme.background,
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
                    backgroundColor: Colors.transparent,
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
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.6,
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
