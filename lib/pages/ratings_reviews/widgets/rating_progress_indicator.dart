import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.ratingLabel,
    required this.rating,
  });
  final String ratingLabel;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        Expanded(flex: 1, child: Text(ratingLabel)),
        Expanded(
          flex: 11,
          child: SizedBox(
            child: LinearProgressIndicator(
              minHeight: 7,
              value: rating * .1,
              borderRadius: BorderRadius.circular(7),
              backgroundColor: TColors.lightSurfaceContainerHigh,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  TColors.lightPrimaryColor),
            ),
          ),
        )
      ]),
    );
  }
}
