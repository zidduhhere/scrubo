import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_discount_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_shop_with_verified_icon.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TProductMetadata extends StatelessWidget {
  const TProductMetadata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price and Sale Price
        const Row(
          children: [
            DiscountContainer(discount: '25'),
            SizedBox(width: TUiConstants.defaultSpacing),
            StrikePriceTextWidget(
              sign: TUiConstants.rupeeSign,
              price: '3000',
            ),
            SizedBox(width: TUiConstants.defaultSpacing / 2),
            PriceTextWidget(price: '2500', sign: TUiConstants.rupeeSign),
          ],
          //Title
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        const TTitleTextWidget(
          text: 'Car Spa Full Service',
        ),
        const SizedBox(height: TUiConstants.spaceBtwTexts),

        //Slot Availability

        Row(
          children: [
            const TTitleTextWidget(text: 'Status'),
            const SizedBox(
              width: TUiConstants.spaceBtwTexts,
            ),
            Text(
              'Slot Available',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: TUiConstants.spaceBtwTexts),
        const TShopWithVerifiedIcon(shopAddress: TTextConstants.shopAddress),
        const SizedBox(height: TUiConstants.defaultSpacing),
      ],
    );
  }
}
