import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/app_strings.dart';
import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/bottom_payment.dart';
import 'package:ecommerce/custom_widgets/image_cart.dart';
import 'package:ecommerce/custom_widgets/labeled_icon.dart';
import 'package:ecommerce/custom_widgets/tab_view.dart';
import 'package:ecommerce/domain/data/data_set.dart';
import 'package:ecommerce/shipping_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/app_colors.dart';
import 'custom_widgets/card_list_item.dart';
import 'custom_widgets/cart_title.dart';
import 'domain/data/shipping_data_set.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = dataSet[widget.id]['liked'];
    final ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: AnimationLimiter(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                children: [
                  AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 70,
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 500),
                        child: CartImage(
                          index: widget.id,
                        ),
                      ),
                    ),
                  ),
                  const AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 100,
                      child: FadeInAnimation(
                        duration: Duration(milliseconds: 500),
                        child: CartTitle(),
                      ),
                    ),
                  ),
                  const AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: Duration(milliseconds: 800),
                    child: SlideAnimation(
                      verticalOffset: 120,
                      child: FadeInAnimation(
                        child: CustomTabView(),
                      ),
                    ),
                  ),
                  const AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      verticalOffset: 150,
                      child: FadeInAnimation(
                        child: TabRow(),
                      ),
                    ),
                  ),
                  const Description(),
                  const ShippingSellerInfo(),
                  const SizedBox(
                    height: 40,
                  ),
                  const PageNumber(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const AppGridView(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 150,
                child: FadeInAnimation(
                  child: BottomPayment(
                    price: dataSet[widget.id]['price'],
                  ),
                ),
              ),
            ),
          ),
          DetailsAppBar(isFavorite: isFavorite),
        ],
      ),
    );
  }
}

class PageNumber extends StatelessWidget {
  const PageNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0x8ECFCFCF),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FaIcon(
                    FontAwesomeIcons.angleLeft,
                    size: 15,
                  ),
                ),
              ),
              AutoSizeText(
                '1',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.buttonColorSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AutoSizeText(
                '2',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AutoSizeText(
                '3',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AutoSizeText(
                '....',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Material(
                elevation: 8.0,
                shape: CircleBorder(),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FaIcon(
                    FontAwesomeIcons.angleRight,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: AutoSizeText(
            'See More',
            textAlign: TextAlign.end,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                color: AppColors.buttonColorSecondary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppGridView extends StatelessWidget {
  const AppGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Recommendations',
              maxLines: 2,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: AppColors.buttonColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AutoSizeText(
              'See More',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: AppColors.buttonColorSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  _createRoute(index),
                );
              },
              child: CardListItem(
                imgUrl: dataSet[index]['image'],
                price: dataSet[index]['price'],
                isFavorite: dataSet[index]['liked'],
              ),
            );
          },
        ),
      ],
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    this.isFavorite,
  });

  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: AppSvgs.back,
                ),
                Row(
                  children: [
                    isFavorite ?? false
                        ? AppSvgs.favoriteChecked
                        : AppSvgs.favoriteUnchecked,
                    const SizedBox(
                      width: 20,
                    ),
                    AppSvgs.share,
                    LabeledIcon(
                      icon: AppSvgs.cartBig,
                      count: 1,
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        AutoSizeText(
          'Description:',
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
            5,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '\u2022 ',
                    maxLines: 2,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      AppStrings.dummyText,
                      maxLines: 3,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
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
          height: 30,
        ),
        AutoSizeText(
          AppStrings.chatText,
          maxLines: 3,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            AutoSizeText(
              'See less',
              maxLines: 1,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: AppColors.buttonColorSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.angleUp,
              color: AppColors.textColor,
              size: 16,
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Divider(
          thickness: 1.5,
          height: 0,
        ),
      ],
    );
  }
}

Route _createRoute(int index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        DetailsPage(id: index),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
