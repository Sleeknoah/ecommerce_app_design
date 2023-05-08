import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/domain/data/shipping_data_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        DefaultTabController(
          length: 2,
          child: TabBar(
            padding: EdgeInsets.zero,
            indicatorColor: AppColors.buttonColorSecondary,
            tabs: const [
              Tab(text: "About item"),
              Tab(text: "Reviews"),
            ],
            labelColor: AppColors.buttonColorSecondary,
            unselectedLabelColor: AppColors.textColor,
            labelStyle: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1.5,
          height: 0,
        ),
      ],
    );
  }
}

class TabRow extends StatelessWidget {
  const TabRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          child: MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            itemCount: itemDataSet.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Flexible(
                    child: Text(
                      itemDataSet[index]['event'],
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: AutoSizeText(
                      itemDataSet[index]['info'],
                      maxLines: 1,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.buttonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          thickness: 1.5,
          height: 0,
        ),
      ],
    );
  }
}
