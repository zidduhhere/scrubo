import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/ratings_reviews/widgets/custom_rating_view_indicator.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_two_text_line.dart';

class HorizontalTabViewCard extends StatelessWidget {
  const HorizontalTabViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/serviceDetails'),
      child: Padding(
        padding: const EdgeInsets.all(
          TUiConstants.paddingMedium,
        ),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(TUiConstants.borderRadiusMedium)),
            color: Colors.white,
            boxShadow: [TShadowStyles.verticalShadow],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shop Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(TUiConstants.borderRadiusMedium),
                  bottomLeft: Radius.circular(TUiConstants.borderRadiusMedium),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    TImages.carSpa,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(TUiConstants.s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shop Name and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Car Full Spa Service',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const Row(children: [
                        TRatingIndicator(
                          rating: 3.5,
                          iconSize: 13,
                        ),
                        SizedBox(width: TUiConstants.s / 2),
                        Text('3.5'),
                      ]),
                      const SizedBox(height: TUiConstants.marginSmall),
                      Row(
                        children: [
                          const Icon(
                            TUiConstants.iconShop,
                            size: TUiConstants.iconSizeMedium,
                          ),
                          const SizedBox(width: TUiConstants.s),
                          Text(
                            'Professional Car Care Services',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(),
                          ),
                        ],
                      ),
                      const SizedBox(height: TUiConstants.marginMedium),
                      const Row(
                        children: [
                          Icon(TUiConstants.iconService,
                              size: TUiConstants.iconSizeMedium),
                          SizedBox(width: TUiConstants.s / 2),
                          TwoTextSameLine(
                            firstText: '15',
                            secondText: ' Services',
                          ),
                          SizedBox(width: TUiConstants.defaultSpacing),
                          Icon(
                            TUiConstants.iconClock,
                            size: TUiConstants.iconSizeMedium,
                            color: TColors.lightSecondary,
                          ),
                          SizedBox(width: TUiConstants.s / 2),
                          TwoTextSameLine(firstText: '2', secondText: ' Hrs')
                        ],
                      ),
                      const SizedBox(height: TUiConstants.marginSmall),
                      const Row(
                        children: [
                          Icon(TUiConstants.iconPickup,
                              size: TUiConstants.iconSizeMedium,
                              color: TColors.lightTertiary),
                          SizedBox(width: TUiConstants.marginSmall),
                          Text(
                            'Free Pickup',
                            style:
                                TextStyle(fontSize: TUiConstants.fontSizeSmall),
                          ),
                          Spacer(),
                          PriceTextWidget(
                              price: '240', sign: TUiConstants.rupeeSign)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutHorizontalContainer extends StatelessWidget {
  const CheckoutHorizontalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
            Radius.circular(TUiConstants.borderRadiusMedium)),
        color: Colors.white,
        boxShadow: [TShadowStyles.verticalShadow],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shop Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TUiConstants.borderRadiusMedium),
              bottomLeft: Radius.circular(TUiConstants.borderRadiusMedium),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                TImages.carSpa,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(TUiConstants.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop Name and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Car Full Spa Service',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const Row(children: [
                    TRatingIndicator(
                      rating: 3.5,
                      iconSize: 13,
                    ),
                    SizedBox(width: TUiConstants.s / 2),
                    Text('3.5'),
                  ]),
                  const SizedBox(height: TUiConstants.marginSmall),
                  Row(
                    children: [
                      const Icon(
                        TUiConstants.iconVerify,
                        size: TUiConstants.iconSizeMedium,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: TUiConstants.s),
                      Text(
                        'Professional Car Care Services',
                        style:
                            Theme.of(context).textTheme.labelSmall!.copyWith(),
                      ),
                    ],
                  ),
                  const SizedBox(height: TUiConstants.m),
                  const Row(
                    children: [
                      Icon(
                        TUiConstants.iconClock,
                        size: TUiConstants.iconSizeMedium,
                        color: TColors.lightSecondary,
                      ),
                      SizedBox(width: TUiConstants.s / 2),
                      TwoTextSameLine(firstText: '2', secondText: ' Hours')
                    ],
                  ),
                  const SizedBox(height: TUiConstants.marginSmall),
                  Row(
                    children: [
                      const Icon(
                        TUiConstants.iconPickup,
                        size: TUiConstants.iconSizeMedium,
                      ),
                      const SizedBox(width: TUiConstants.marginSmall),
                      TwoTextSameLine(
                        firstText: 'Free',
                        secondText: ' Pickup',
                        firstStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
