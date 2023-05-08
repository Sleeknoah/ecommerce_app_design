import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledIcon extends StatelessWidget {
  const LabeledIcon({
    Key? key,
    required this.icon,
    required this.count,
    this.isNotification = false,
    required this.width,
    required this.height,
  }) : super(key: key);

  final Widget icon;
  final int count;
  final bool? isNotification;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Center(child: icon),
          Positioned(
            bottom: height / 2,
            left: width / 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 6.0,
                ),
                child: Center(
                  child: AutoSizeText(
                    isNotification! ? '$count+' : '$count',
                    style: GoogleFonts.nunito(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    maxFontSize: 12,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
