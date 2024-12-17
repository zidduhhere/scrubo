import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class RatingsShareWidget extends StatelessWidget {
  const RatingsShareWidget({
    super.key,
    required this.totalRatings,
    required this.rating,
  });

  final double rating;
  final int totalRatings;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              TUiConstants.iconStarFilled,
              color: Colors.amber,
            ),
            const SizedBox(width: TUiConstants.defaultSpacing / 2),
            RichText(
              softWrap: true,
              text:
                  TextSpan(style: const TextStyle(wordSpacing: 10), children: [
                TextSpan(
                    text: rating.toString(),
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                  text: '($totalRatings)',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ]),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(TUiConstants.iconShare))
      ],
    );
  }
}
