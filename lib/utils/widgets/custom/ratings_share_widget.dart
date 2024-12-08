import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class RatingsShareWidget extends StatelessWidget {
  const RatingsShareWidget({
    super.key,
  });

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
                    text: '5.0', style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                  text: '(199)',
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
