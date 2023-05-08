import 'package:ecommerce/custom_widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_svgs.dart';
import 'labeled_icon.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: AppTextField(),
            ),
          ),
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
            width: 20,
          ),
        ],
      ),
    );
  }
}
