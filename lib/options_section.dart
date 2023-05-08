import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/custom_widgets/indicator.dart';
import 'package:ecommerce/custom_widgets/quick_links_tile.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/carousel.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 16.0,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: LinkTile(
                    quickLink: links[index],
                    icons: icons[index],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AppIndicator(
                  index: index,
                  currentIndex: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> links = [
  "Category",
  "Flight",
  "Bill",
  "Data plan",
  "Top Up",
];

List<Widget> icons = [
  AppSvgs.category,
  AppSvgs.flight,
  AppSvgs.bills,
  AppSvgs.data,
  AppSvgs.topUp,
];
