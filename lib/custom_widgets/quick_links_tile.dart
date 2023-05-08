import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkTile extends StatelessWidget {
  const LinkTile({
    Key? key,
    required this.quickLink,
    required this.icons,
  }) : super(key: key);

  final String quickLink;
  final Widget icons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.quickLink,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: icons,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          quickLink,
          style: GoogleFonts.nunito(
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.searchIconColor,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
