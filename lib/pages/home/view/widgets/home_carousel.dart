import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/view/home_view_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class CustomHomeCarousel extends StatelessWidget {
  const CustomHomeCarousel({
    super.key,
  });

  static HomeViewController homeviewController = Get.find<HomeViewController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlay: false,
            animateToClosest: true,
          ),
          itemCount: homeviewController.items.length,
          itemBuilder: (context, index, pageViewIndex) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200,
                  width: THelperFunctions.getDeviceWidth(context) * .9,
                  margin: const EdgeInsets.all(TUiConstants.s),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius:
                        BorderRadius.circular(TUiConstants.borderRadiusLarge),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30,
                        right: 0,
                        child: Image.asset(
                          homeviewController.items[index]!['image']!,
                          height: TUiConstants.carouselImageHeight / 2,
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 30,
                        child: Text(
                          homeviewController.items[index]!['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 30,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(120, 50),
                              backgroundColor: Colors.black,
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    TUiConstants.borderRadiusMedium),
                              ),
                            ),
                            child: Text(
                              TTextConstants.bookNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: TUiConstants.fontSizeSmall,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                            )),
                      ),
                      // Text(
                      //   homeviewController.items[index]!['description']!,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .labelSmall!
                      //       .copyWith(
                      //           color: Theme.of(context)
                      //               .colorScheme
                      //               .secondary),
                      // ),
                      Positioned(
                        top: 30,
                        left: 30,
                        child: Text(
                          homeviewController.items[index]!['offer']!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: TUiConstants.headlineLarge * 1.2,
                                  // sfontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 120,
                        child: Text(
                          "OFF",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: TUiConstants.headlineMedium,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Row(children: [
          for (int i = 0; i < homeviewController.items.length; i++) Container(),
        ]),
      ],
    );
  }
}
