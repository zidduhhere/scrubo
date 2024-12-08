import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TTitleTextWidget extends StatelessWidget {
  const TTitleTextWidget({super.key, required this.text, this.isSmall = false});
  final String text;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isSmall
          ? Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w600,
              textBaseline: TextBaseline.alphabetic,
              color: Theme.of(context).colorScheme.secondary)
          : Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
    );
  }
}

class TBillingTitleText extends StatelessWidget {
  const TBillingTitleText(
      {super.key, required this.text, this.isSmall = false});

  final String text;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isSmall
          ? Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: TUiConstants.fontSizeVerySmall,
              fontWeight: FontWeight.w600,
              textBaseline: TextBaseline.alphabetic,
              color: Theme.of(context).colorScheme.secondary)
          : Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
    );
  }
}

class TBookingHistoryTitleText extends StatelessWidget {
  const TBookingHistoryTitleText(
      {super.key, required this.text, required this.isSmall});

  final String text;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: isSmall
          ? Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: TUiConstants.fontSizeSmall,
              fontWeight: FontWeight.w600,
              textBaseline: TextBaseline.alphabetic,
              color: Theme.of(context).colorScheme.primary)
          : Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
    );
  }
}
