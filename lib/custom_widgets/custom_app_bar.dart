import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/custom_widgets/carousel.dart';
import 'package:ecommerce/custom_widgets/labeled_icon.dart';
import 'package:ecommerce/custom_widgets/text_field.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 0.0,
      ),
      sliver: SliverAppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: AppTextField(),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: SizedBox.shrink(),
        ),
        backgroundColor: Colors.white,
        expandedHeight: MediaQuery.of(context).size.height * 0.31,
        flexibleSpace: const Carousel(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: LabeledIcon(
              icon: AppSvgs.cartBig,
              count: 1,
              width: 60,
              height: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: LabeledIcon(
              icon: AppSvgs.chat,
              count: 9,
              width: 60,
              height: 60,
              isNotification: true,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
