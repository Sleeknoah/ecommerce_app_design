import 'package:ecommerce/core/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: BoxDecoration(
              color: AppColors.buttonColorSecondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  7.0,
                ),
                bottomLeft: Radius.circular(
                  7.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  AppSvgs.cartLight,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.nunito(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                7.0,
              ),
              bottomRight: Radius.circular(
                7.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            child: Text(
              'Buy Now',
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
