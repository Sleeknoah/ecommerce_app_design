import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/custom_widgets/call_to_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_colors.dart';
import 'domain/data/shipping_data_set.dart';

class ShippingSellerInfo extends StatelessWidget {
  const ShippingSellerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        AutoSizeText(
          'Shippings Information:',
          maxLines: 2,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: AppColors.buttonColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: List.generate(
            shippingDataSet.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    shippingDataSet[index]['event'] == null
                        ? 'Arrive:  '
                        : '${shippingDataSet[index]['event']}:  ',
                    maxLines: 2,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      '${shippingDataSet[index]['info']}',
                      maxLines: 3,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Divider(
          thickness: 1.5,
          height: 0,
        ),
        const SizedBox(
          height: 20,
        ),

        ///Sellers info
        AutoSizeText(
          'Seller\'s Information:',
          maxLines: 2,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: AppColors.buttonColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.backgroundColor,
                  child: AutoSizeText(
                    'Thrifting\nStore.',
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 1,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: AppColors.backgroundColor,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Thrifting_Store',
                      maxLines: 1,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.buttonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            'Active 5 mins ago ',
                            maxLines: 1,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            '| ',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            '96.7% Positive Feedback',
                            maxLines: 1,
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        border: Border.all(
                          color: AppColors.buttonColorSecondary,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppSvgs.homeSelected,
                            const SizedBox(
                              width: 10,
                            ),
                            AutoSizeText(
                              'Visit Store',
                              maxLines: 1,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: AppColors.buttonColorSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness: 1.5,
          height: 0,
        ),
      ],
    );
  }
}
