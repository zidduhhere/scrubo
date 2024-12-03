import 'package:flutter/material.dart';
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
    return Padding(
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
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              TUiConstants.iconStarFilled,
                              color: Colors.amber,
                              size: TUiConstants.iconSizeSmall,
                            ),
                            const Icon(
                              TUiConstants.iconStarFilled,
                              color: Colors.amber,
                              size: TUiConstants.iconSizeSmall,
                            ),
                            const Icon(
                              TUiConstants.iconStarFilled,
                              color: Colors.amber,
                              size: TUiConstants.iconSizeSmall,
                            ),
                            const Icon(
                              TUiConstants.iconStarFilled,
                              color: Colors.amber,
                              size: TUiConstants.iconSizeSmall,
                            ),
                            const Icon(
                              TUiConstants.iconStarHalf,
                              color: Colors.amber,
                              size: TUiConstants.iconSizeSmall,
                            ),
                            const SizedBox(width: TUiConstants.s),
                            Text(
                              '4.5',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          color: TColors.lightTertiary,
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
    );
  }
}
