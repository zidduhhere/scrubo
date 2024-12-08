import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class PriceTextWidget extends StatelessWidget {
  const PriceTextWidget(
      {super.key,
      required this.price,
      required this.sign,
      this.priceStyle,
      this.signFontSize});

  final String price;
  final String sign;
  final TextStyle? priceStyle;
  final double? signFontSize;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: price,
        style: priceStyle ??
            Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
        children: [
          TextSpan(
            text: sign,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: signFontSize ?? TUiConstants.fontSizeMedium,
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
    this.priceStyle,
    this.signFontSize,
    this.signColor,
  });

  final String price;
  final String sign;
  final TextStyle? priceStyle;
  final double? signFontSize;
  final Color? signColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: price,
          style: priceStyle ??
              Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).colorScheme.error,
                  ),
          children: [
            TextSpan(
              text: sign,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: signColor ?? Theme.of(context).colorScheme.error,
                    fontSize: signFontSize ?? TUiConstants.fontSizeMedium,
                  ),
            ),
          ]),
    );
  }
}

class CheckoutPriceTextWidget extends StatelessWidget {
  const CheckoutPriceTextWidget(
      {super.key,
      required this.price,
      required this.sign,
      this.signColor,
      this.signFontSize,
      this.priceFontSize});

  final String price;
  final String sign;
  final double? priceFontSize;
  final Color? signColor;
  final double? signFontSize;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: price,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: priceFontSize ?? TUiConstants.fontSizeSmall),
          children: [
            TextSpan(
              text: sign,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: signColor ?? Theme.of(context).colorScheme.onSurface,
                    fontSize: signFontSize ?? TUiConstants.fontSizeMedium,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ]),
    );
  }
}
