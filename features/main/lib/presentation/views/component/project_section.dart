import 'package:core/ui/component/default_border_card.dart';
import 'package:core/ui/component/default_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:main/presentation/controllers/main_controller.dart';

class ProjectSection extends StatelessWidget {
  final MainController controller;

  const ProjectSection({super.key, required this.controller});

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
            height: 144,
          ),
          /** Project Title */
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
                'My Portfolio',
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
              text: 'My Latest',
              style: Get.textTheme.bodyLarge?.copyWith(
                color: Get.theme.colorScheme.tertiary,
                fontSize: 36,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: ' Projects',
                  style: Get.textTheme.labelLarge?.copyWith(
                    color: Get.theme.colorScheme.onBackground,
                    fontSize: 36,
                    fontStyle: FontStyle.normal,
                  ),
                )
              ],
            ),
          ),
          /** Projects */
          SizedBox(
            height: 32,
          ),
          MasonryGridView.builder(
            itemCount: 5,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            shrinkWrap: true,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => DefaultButtonCustom(
              appMode: controller.appPersistence.getAppMode(),
              radiusSplash: 8,
              onClick: () {},
              content: DefaultBorderCard(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   '../../assets/images/img_stanley.webp',
                    //   height: 120,
                    // ),
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      child: Container(
                        height: 360,
                        color: Get.theme.colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(
                        5,
                        (index) => Container(
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.tertiary,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Text(
                              'Android Native',
                              style: Get.textTheme.labelSmall?.copyWith(
                                color: Get.theme.colorScheme.onTertiary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cinebox - Personal Movies App',
                          style: Get.textTheme.labelMedium?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                            fontSize: 20,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Get.theme.colorScheme.primary,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Get.theme.colorScheme.secondaryContainer,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
