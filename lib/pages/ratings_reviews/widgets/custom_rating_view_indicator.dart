import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TRatingIndicator extends StatelessWidget {
  const TRatingIndicator({super.key, required this.rating, this.iconSize = 20});

  final double rating;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: TColors.lightSurfaceContainerHigh,
      itemSize: iconSize,
      rating: rating,
      itemBuilder: (_, __) => Icon(
        TUiConstants.iconStar,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
