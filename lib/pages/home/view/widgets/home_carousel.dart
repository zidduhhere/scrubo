import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class CustomHomeCarousel extends StatelessWidget {
  const CustomHomeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeViewController homeviewController = Get.find<HomeViewController>();
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (index, _) {
              homeviewController.changeCarouselIndex(index);
            },
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
                    width: THelperFunctions.getDeviceWidth(context) * 1,
                    margin: const EdgeInsets.all(TUiConstants.s),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
                      borderRadius:
                          BorderRadius.circular(TUiConstants.borderRadiusLarge),
                    ),
                    child: LayoutBuilder(builder: (context, constraints) {
                      String? imageLoc =
                          homeviewController.items[index]!['image']!;
                      String? description =
                          homeviewController.items[index]!['description']!;
                      String? title =
                          homeviewController.items[index]!['title']!;
                      String? offer = homeviewController.items[index]!['offer'];
                      bool offerExists = offer != null && offer.isNotEmpty;
                      //Get Image Size
                      AssetImage assetImage = AssetImage(
                        homeviewController.items[index]!['image']!,
                      );
                      ImageStream imageStream = assetImage.resolve(
                        const ImageConfiguration(),
                      );

                      // late double imageWidth;
                      // late double imageHeight;

                      imageStream.addListener(
                        ImageStreamListener(
                          (info, _) {
                            // imageWidth = info.image.width.toDouble();
                            // imageHeight = info.image.height.toDouble();
                          },
                        ),
                      );

                      return Stack(
                        children: [
                          Positioned(
                            top: index == 0 ? 0 : constraints.maxHeight * 0.1,
                            right: 0,
                            bottom:
                                index == 0 ? 0 : -constraints.maxHeight * 0.05,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  TUiConstants.borderRadiusLarge),
                              child: Image.asset(
                                imageLoc,
                                alignment: Alignment.centerRight,
                                height: TUiConstants.carouselImageHeight / 1,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 30,
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: offerExists
                                        ? TUiConstants.fontSizeSmall
                                        : TUiConstants.fontSizeMediumLarge,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 30,
                            child: Text(
                              description,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          // Positioned(
                          //   top: 130,
                          //   left: 30,
                          //   child: ElevatedButton(
                          //       onPressed: () {},
                          //       style: ElevatedButton.styleFrom(
                          //         fixedSize: const Size(120, 50),
                          //         backgroundColor: Colors.black,
                          //         foregroundColor: Theme.of(context)
                          //             .colorScheme
                          //             .onPrimaryContainer,
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(
                          //               TUiConstants.borderRadiusMedium),
                          //         ),
                          //       ),
                          //       child: Text(
                          //         TTextConstants.bookNow,
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .labelLarge!
                          //             .copyWith(
                          //               fontSize: TUiConstants.fontSizeSmall,
                          //               fontWeight: FontWeight.w600,
                          //               color: Colors.white,
                          //             ),
                          //       )),
                          // ),
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
                          offerExists
                              ? Positioned(
                                  top: 30,
                                  left: 30,
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                        text: offer,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  TUiConstants.headlineLarge *
                                                      1.5,
                                              // sfontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: TTextConstants.off
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                    fontSize: TUiConstants
                                                        .headlineSmall,
                                                    fontWeight: FontWeight.w300,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondaryContainer),
                                          ),
                                        ]),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      );
                    })),
              ],
            );
          },
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < homeviewController.items.length; i++)
                TRoundedContainer(
                  backgroundColor: i == homeviewController.carouselIndex.value
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300],
                  radius: 20,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: const SizedBox(
                    height: TUiConstants.indicatorHeight,
                    width: TUiConstants.indicatorWidth,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
