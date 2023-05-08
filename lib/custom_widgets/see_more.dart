import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeMoreLink extends StatelessWidget {
  const SeeMoreLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            'Best Sales Product',
            maxLines: 2,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AutoSizeText(
            'See More',
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: AppColors.buttonColorSecondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
