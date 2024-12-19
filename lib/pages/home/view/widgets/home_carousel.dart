import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/home/controllers/banner_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';
import 'package:scrubo/utils/widgets/cards/custom_cached_image.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/containers/custom_shimmer.dart';

class CustomHomeCarousel extends StatelessWidget {
  const CustomHomeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BannerController bannerController = Get.put(BannerController());
    return ClipRRect(
      borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge * 1),
      child: Column(
        children: [
          Obx(
            () {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  clipBehavior: Clip.antiAlias,
                  onPageChanged: (index, _) {
                    bannerController.changeCarouselIndex(index);
                  },
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  autoPlay: false,
                  animateToClosest: true,
                ),
                itemCount: bannerController.carouselList.length,
                itemBuilder: (context, index, pageViewIndex) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () {
                          if (bannerController.carouselList.isEmpty) {
                            return const Center(
                              child: Text('No banners found'),
                            );
                          }
                          if (bannerController.isLoading.value) {
                            return TShimmerEffect(
                                width:
                                    THelperFunctions.getDeviceWidth(context) *
                                        1,
                                height: 200);
                          } else {
                            final item = bannerController.carouselList[index];
                            return Container(
                              height: 200,
                              width:
                                  THelperFunctions.getDeviceWidth(context) * 1,
                              margin: const EdgeInsets.all(TUiConstants.s),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color(0xff24C6DC),
                                      Color(0xff514A9D),
                                    ]),
                                borderRadius: BorderRadius.circular(
                                    TUiConstants.borderRadiusLarge),
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  String? image = item.image;

                                  String? description = item.description;
                                  String? title = "Use code ${item.couponCode}";
                                  String? discount = item.discount != 0
                                      ? "${item.discount.toString()}%"
                                      : "";
                                  String shop = item.shop ?? '';
                                  // String targetScreen = item.targetScreen;
                                  return Stack(
                                    children: [
                                      Positioned(
                                        top: constraints.maxHeight * 0.1,
                                        right: 0,
                                        bottom: -constraints.maxHeight * 0.05,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              TUiConstants.borderRadiusLarge),
                                          child: TCachedNetworkImage(
                                            isNetworkImage: true,
                                            image: image,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 90,
                                        left: 30,
                                        child: Text(
                                          title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontSize:
                                                    TUiConstants.fontSizeMedium,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 110,
                                        left: 30,
                                        child: Text(
                                          description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                      discount.isNotEmpty
                                          ? Positioned(
                                              top: 30,
                                              left: 30,
                                              child: RichText(
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                    text: discount.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: TUiConstants
                                                                  .headlineLarge *
                                                              1.5,
                                                          // sfontWeight: FontWeight.w600,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onPrimaryContainer,
                                                        ),
                                                    children: [
                                                      TextSpan(
                                                        text: TTextConstants.off
                                                            .toUpperCase(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelLarge!
                                                            .copyWith(
                                                              fontSize: TUiConstants
                                                                  .headlineSmall,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimaryContainer,
                                                            ),
                                                      ),
                                                    ]),
                                              ),
                                            )
                                          : const SizedBox(),
                                      Positioned(
                                          top: 130,
                                          left: 30,
                                          child: Text(
                                            shop,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimaryContainer,
                                                ),
                                          ))
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < bannerController.carouselList.length; i++)
                  TRoundedContainer(
                    backgroundColor:
                        i == bannerController.carouselCurrentIndex.value
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
      ),
    );
  }
}
