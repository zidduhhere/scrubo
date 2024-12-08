import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key, required this.discount});

  final String discount;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(
          horizontal: TUiConstants.s / 1.5, vertical: TUiConstants.s / 2),
      backgroundColor: Theme.of(context).colorScheme.primary,
      diffRadius: true,
      borderRadius: BorderRadius.circular(TUiConstants.borderRadiusSmall),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: discount,
            children: [
              TextSpan(
                text: '%',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: TUiConstants.fontSizeVerySmall,
                    ),
              ),
            ],
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: TUiConstants.fontSizeVerySmall,
                ),
          ),
        ),
      ),
    );
  }
}
