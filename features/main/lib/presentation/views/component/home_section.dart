import 'package:flutter/material.dart';
import 'package:main/presentation/controllers/main_controller.dart';

class HomeSection extends StatelessWidget {
  final MainController controller;

  const HomeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 8)),
      child: Column(
        children: [
        ],
      ),
    );
  }
}
