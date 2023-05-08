import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_svgs.dart';
import '../core/app_colors.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            AutoSizeText(
              'Thrifting_Store',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: AppColors.searchIconColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AutoSizeText(
          'Essentials Men\'s Short-Sleeve\nCrewneck T-Shirt',
          maxLines: 2,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: AppColors.buttonColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  AppSvgs.rating,
                  const SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: AutoSizeText(
                      '4.9 Ratings',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '\u2022',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Expanded(
              child: AutoSizeText(
                '2.3k+ Reviews',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '\u2022',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Expanded(
              child: AutoSizeText(
                '2.9k+ Sold',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
