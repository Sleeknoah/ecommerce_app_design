import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/custom_widgets/check_out_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_colors.dart';

class BottomPayment extends StatelessWidget {
  const BottomPayment({Key? key, required this.price}) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // Shadow for top-left corner
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 20),
            blurRadius: 50,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Total Price',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: AppColors.searchIconColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    '\$$price',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: AppColors.buttonColorSecondary,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const CheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
