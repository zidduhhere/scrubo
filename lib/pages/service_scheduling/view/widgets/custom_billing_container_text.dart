import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TCheckoutBillingContainerText extends StatelessWidget {
  const TCheckoutBillingContainerText({
    super.key,
    required this.label,
    required this.value,
    this.isPriceSmall = false,
  });

  final String label;
  final String value;
  final bool isPriceSmall;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: TBillingTitleText(
              text: label,
              isSmall: true,
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: CheckoutPriceTextWidget(
                signFontSize:
                    isPriceSmall ? TUiConstants.fontSizeVerySmall : null,
                priceFontSize:
                    isPriceSmall ? TUiConstants.fontSizeVerySmall : null,
                price: value,
                sign: TUiConstants.rupeeSign),
          )
        ],
      ),
    );
  }
}

class TCheckoutShippingContainerText extends StatelessWidget {
  const TCheckoutShippingContainerText({
    super.key,
    required this.label,
    required this.value,
    this.isPriceSmall = false,
  });

  final String label;
  final String value;
  final bool isPriceSmall;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: TBillingTitleText(
              text: label,
              isSmall: true,
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: CheckoutPriceTextWidget(
                signFontSize:
                    isPriceSmall ? TUiConstants.fontSizeVerySmall : null,
                priceFontSize:
                    isPriceSmall ? TUiConstants.fontSizeVerySmall : null,
                price: value,
                sign: TUiConstants.rupeeSign),
          )
        ],
      ),
    );
  }
}
