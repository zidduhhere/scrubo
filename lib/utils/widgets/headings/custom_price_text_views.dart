import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class PriceTextWidget extends StatelessWidget {
  const PriceTextWidget({super.key, required this.price, required this.sign});

  final String price;
  final String sign;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: price,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
        children: [
          TextSpan(
            text: sign,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}

class StrikePriceTextWidget extends StatelessWidget {
  const StrikePriceTextWidget({
    super.key,
    required this.sign,
    required this.price,
  });

  final String price;
  final String sign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: price,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).colorScheme.error,
              ),
          children: [
            TextSpan(
              text: sign,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ]),
    );
  }
}

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({super.key, required this.discount});

  final String discount;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
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
