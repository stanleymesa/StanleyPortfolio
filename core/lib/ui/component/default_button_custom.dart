import 'package:flutter/material.dart';

import '../../shared_data/enum/app_mode.dart';

class DefaultButtonCustom extends StatelessWidget {
  final AppMode appMode;
  final double radiusSplash;
  final Widget content;
  final Function() onClick;

  const DefaultButtonCustom({
    super.key,
    required this.appMode,
    this.radiusSplash = 16,
    required this.content,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        Positioned.fill(
          child: SizedBox(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(radiusSplash)),
                splashColor: appMode == AppMode.LIGHT
                    ? Colors.black.withOpacity(0.1)
                    : Colors.white.withOpacity(0.1),
                onTap: () {
                  onClick();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
