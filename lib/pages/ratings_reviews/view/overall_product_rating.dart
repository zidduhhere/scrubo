import 'package:flutter/material.dart';
import 'package:scrubo/pages/ratings_reviews/widgets/rating_progress_indicator.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';

class OverallProdcutRating extends StatelessWidget {
  const OverallProdcutRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: TUiConstants.fontSizeExtraLarge * 2,
                ),
          ),
        ),
        Expanded(
          flex: 7,
          child: SizedBox(
            height: TDeviceUtility.getDeviceHeight(context) * .15,
            child: const Column(
              children: [
                TRatingProgressIndicator(
                  ratingLabel: '5',
                  rating: 5,
                ),
                TRatingProgressIndicator(
                  ratingLabel: '4',
                  rating: 8,
                ),
                TRatingProgressIndicator(
                  ratingLabel: '3',
                  rating: 3,
                ),
                TRatingProgressIndicator(
                  ratingLabel: '2',
                  rating: 2,
                ),
                TRatingProgressIndicator(
                  ratingLabel: '1',
                  rating: 1,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
