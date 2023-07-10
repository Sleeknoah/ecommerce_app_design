import 'dart:async';

import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/custom_widgets/app_bar_content.dart';
import 'package:ecommerce/custom_widgets/carousel.dart';
import 'package:ecommerce/custom_widgets/custom_app_bar.dart';
import 'package:ecommerce/custom_widgets/see_more.dart';
import 'package:ecommerce/details_screen.dart';
import 'package:ecommerce/domain/data/data_set.dart';
import 'package:ecommerce/options_section.dart';
import 'package:ecommerce/state_management/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'core/app_svgs.dart';
import 'custom_widgets/card_list_item.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenTestState();
}

class _MainScreenTestState extends ConsumerState<MainScreen> {
  double? offset;
  final appBarSize = 180;
  final zeroOpacityOffset = 0;
  ScrollController controller = ScrollController();
  int _currentIndex = 0;
  late final appBarHeight;

  double get opacity {
    if (offset == null) {
      return 0;
    } else {
      if (appBarSize == zeroOpacityOffset) {
        return 1;
      } else if (appBarSize > zeroOpacityOffset) {
        // fading in
        if (offset! <= zeroOpacityOffset) {
          return 0;
        } else if (offset! >= appBarSize) {
          return 1;
        } else {
          return (offset! - zeroOpacityOffset) /
              (appBarSize - zeroOpacityOffset);
        }
      } else {
        // fading out
        if (offset! <= appBarSize) {
          return 1;
        } else if (offset! >= zeroOpacityOffset) {
          return 0;
        } else {
          return (offset! - appBarSize) / (zeroOpacityOffset - appBarSize);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appBarHeight = (MediaQuery.of(context).size.height * 0.38);
      Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (controller.hasClients) {
          offset = controller.offset;
          controller.addListener(_setOffset);
        }
      });
    });
  }

  void _setOffset() {
    setState(() {
      offset = controller.offset;
    });
    ref.read(offsetProvider.notifier).state = offset;

    // print(ref.watch(offsetProvider));
    // print(appBarHeight);
  }

  @override
  dispose() {
    controller.removeListener(_setOffset);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(opacity);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.backgroundColor,
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              controller: controller,
              children: [
                const Carousel(),
                StickyHeader(
                  header: header(),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemCount: dataSet.length,
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
                  ),
                ),
              ],
            ),
          ),
          Opacity(
            opacity: opacity,
            child: Material(
              elevation: 8.0,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: const AppBarContent(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.buttonColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.buttonColor,
          fontWeight: FontWeight.w700,
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.homeSelected,
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.home,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.ticket,
                color: AppColors.buttonColorSecondary,
              ),
            ),
            label: 'Voucher',
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.ticket,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Wallet',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.walletSelected,
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.wallet,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.settingsSelected,
            ),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgs.settings,
            ),
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Column(
    children: const [
      Options(),
      SeeMoreLink(),
    ],
  );
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
