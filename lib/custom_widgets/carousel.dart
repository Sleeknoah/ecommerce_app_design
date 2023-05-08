import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/custom_widgets/call_to_action_button.dart';
import 'package:ecommerce/custom_widgets/indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: carouselList.length,
            physics: const PageScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return carouselList[index];
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            right: 24,
            child: Row(
              children: List.generate(
                carouselList.length,
                (index) => AppIndicator(
                  index: index,
                  currentIndex: currentIndex,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<CarouselImageView> carouselList = [
  const CarouselImageView(
    image: 'assets/png/image_1.png',
    title: "DISCOVER YOUR BEAUTY SELECTION",
    hashtag: "#SPRING SALES",
  ),
  const CarouselImageView(
    image: 'assets/png/image_2.jpg',
    title: "80% OFF",
    hashtag: "#BLACK SHOPPING",
    description: "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit",
  ),
  const CarouselImageView(
    image: 'assets/png/image_3.jpg',
    title: "MEN'S WEARS",
    hashtag: "#FASHION WEEK",
    description: "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit",
  ),
];

class CarouselImageView extends StatelessWidget {
  const CarouselImageView({
    Key? key,
    required this.image,
    this.hashtag,
    required this.title,
    this.description,
  }) : super(key: key);

  final String image;
  final String? hashtag;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: 500,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black26,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: 24,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                hashtag != null
                    ? Text(
                        hashtag!,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 2.0,
                ),
                AutoSizeText(
                  title,
                  maxLines: 2,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                description != null
                    ? AutoSizeText(
                        description!,
                        maxLines: 2,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                const ActionButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
