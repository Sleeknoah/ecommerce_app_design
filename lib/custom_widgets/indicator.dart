import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: 3,
        width: index == currentIndex ? 10 : 3,
        decoration: BoxDecoration(
          shape: index == currentIndex ? BoxShape.rectangle : BoxShape.circle,
          color: index == currentIndex
              ? AppColors.buttonColor
              : AppColors.backgroundColor,
          borderRadius: index == currentIndex
              ? BorderRadius.circular(
                  10,
                )
              : null,
        ),
      ),
    );
  }
}
