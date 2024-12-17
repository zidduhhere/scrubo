import 'package:flutter/material.dart';
import 'package:scrubo/pages/ratings_reviews/widgets/custom_rating_view_indicator.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/containers/circular_image_container.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/custom/custom_readmore_text.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const TCircualrImage(
                    imageUrl: TImages.avatar, width: 40, height: 40),
                const SizedBox(width: TUiConstants.spaceBtwTexts),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const Icon(TUiConstants.iconMenu)
          ],
        ),
        //Review
        const SizedBox(height: TUiConstants.spaceBtwTexts),
        const Row(
          children: [
            TRatingIndicator(rating: 4.5),
            SizedBox(
              width: TUiConstants.s,
            ),
            Text('01 Nov 2024')
          ],
        ),
        const SizedBox(height: TUiConstants.spaceBtwTexts),
        const TCustomReadMoreText(),

        //Company Review

        TRoundedContainer(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          padding: const EdgeInsets.all(TUiConstants.m),
          margin: const EdgeInsets.only(top: TUiConstants.spaceBtwTexts),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: TDeviceUtility.getDeviceWidth(context) * 0.4,
                    child: Text(
                      TTextConstants.shopAddress,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "02 Nov 2023",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
              const SizedBox(height: TUiConstants.spaceBtwTexts),
              const TCustomReadMoreText(),
            ],
          ),
        ),
        const SizedBox(
          height: TUiConstants.spaceBtwSections,
        )
      ],
    );
  }
}
