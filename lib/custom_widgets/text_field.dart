import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        border: Border.all(
          color: AppColors.searchIconColor,
          width: 1.5,
        ),
      ),
      child: TextField(
        cursorColor: AppColors.searchBarColor,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: AppColors.searchIconColor,
            fontSize: 15,
          ),
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: AppSvgs.search,
          ),
          contentPadding: const EdgeInsets.only(
            left: 0.0,
            top: 11.0,
            bottom: 11.0,
          ),
        ),
      ),
    );
  }
}
