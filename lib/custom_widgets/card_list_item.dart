import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({
    Key? key,
    required this.imgUrl,
    required this.price,
    this.isFavorite = false,
  }) : super(key: key);

  final String imgUrl;
  final double price;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    const height = 250.0;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      width: width / 2,
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: const Color(0xFFDBDCDF),
              borderRadius: BorderRadius.circular(2.0),
              image: DecorationImage(
                image: NetworkImage(
                  imgUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFFF6F5F8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 2.0,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Shirt',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: AppColors.searchIconColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              AutoSizeText(
                                'Essentials Men\'s Short-\nSleeveCrewneck T-Shirt',
                                maxLines: 2,
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: AppColors.buttonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppSvgs.rating,
                              const SizedBox(
                                width: 2,
                              ),
                              AutoSizeText(
                                '4.9 | 2356',
                                maxLines: 2,
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: AppColors.searchIconColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                '\$$price',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: AppColors.buttonColorSecondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: isFavorite ?? false
                ? AppSvgs.favoriteChecked
                : AppSvgs.favoriteUnchecked,
          ),
        ],
      ),
    );
  }
}
