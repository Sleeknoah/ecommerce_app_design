import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgs {
  static get cartLight => SvgPicture.asset(
        'assets/svg/shopping_bag.svg',
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      );

  static get cartDark => SvgPicture.asset(
        'assets/svg/shopping_bag.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get cartBig => SvgPicture.asset(
        'assets/svg/shopping_bag.svg',
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          AppColors.buttonColor,
          BlendMode.srcIn,
        ),
      );

  static get category => SvgPicture.asset(
        'assets/svg/category.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get flight => SvgPicture.asset(
        'assets/svg/flight.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get data => SvgPicture.asset(
        'assets/svg/data.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get favoriteChecked => SvgPicture.asset(
        'assets/svg/favorite_checked.svg',
        width: 25,
        height: 25,
        colorFilter: const ColorFilter.mode(
          Colors.pinkAccent,
          BlendMode.srcIn,
        ),
      );

  static get favoriteUnchecked => SvgPicture.asset(
        'assets/svg/favorite_checked.svg',
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get bills => SvgPicture.asset(
        'assets/svg/bills.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get topUp => SvgPicture.asset(
        'assets/svg/top_up.svg',
        width: 20,
        height: 20,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get rating => SvgPicture.asset(
        'assets/svg/rating.svg',
        colorFilter: const ColorFilter.mode(
          Color(0xFFF9A23B),
          BlendMode.srcIn,
        ),
      );

  static get share => SvgPicture.asset(
        'assets/svg/share.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get chat => SvgPicture.asset(
        'assets/svg/chat.svg',
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          AppColors.buttonColor,
          BlendMode.srcIn,
        ),
      );

  static get search => SvgPicture.asset(
        'assets/svg/search.svg',
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(
          AppColors.searchIconColor,
          BlendMode.srcIn,
        ),
      );

  static get home => SvgPicture.asset(
        'assets/svg/home.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get homeSelected => SvgPicture.asset(
        'assets/svg/home.svg',
        colorFilter: ColorFilter.mode(
          AppColors.buttonColorSecondary,
          BlendMode.srcIn,
        ),
      );

  static get voucher => SvgPicture.asset(
        'assets/svg/voucher.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get wallet => SvgPicture.asset(
        'assets/svg/wallet.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get walletSelected => SvgPicture.asset(
        'assets/svg/wallet.svg',
        colorFilter: ColorFilter.mode(
          AppColors.buttonColorSecondary,
          BlendMode.srcIn,
        ),
      );

  static get settings => SvgPicture.asset(
        'assets/svg/settings.svg',
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );

  static get settingsSelected => SvgPicture.asset(
        'assets/svg/settings.svg',
        colorFilter: ColorFilter.mode(
          AppColors.buttonColorSecondary,
          BlendMode.srcIn,
        ),
      );

  static get back => SvgPicture.asset(
        'assets/svg/back.svg',
        width: 30,
        height: 30,
        colorFilter: ColorFilter.mode(
          AppColors.iconColor,
          BlendMode.srcIn,
        ),
      );
}
