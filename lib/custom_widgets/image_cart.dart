import 'package:ecommerce/core/app_svgs.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/domain/data/data_set.dart';
import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  const CartImage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(),
        ),
        Stack(
          children: [
            Card(
              color: const Color(0xFFF7F7F7),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      dataSet[index]['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Column(
                children: List.generate(
                  4,
                  (listIndex) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                        color: const Color(0x8ECFCFCF),
                        image: DecorationImage(
                          image: NetworkImage(
                            dataSet[index]['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
