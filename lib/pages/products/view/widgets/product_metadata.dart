import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/products/controllers/products_controller.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_discount_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_shop_with_verified_icon.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TProductMetadata extends StatelessWidget {
  const TProductMetadata({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductsController.instance;
    final variation = product.varitaions[controller.variationIndex.value];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price and Sale Price
        Row(
          children: [
            const DiscountContainer(discount: '10'),
            const SizedBox(width: TUiConstants.defaultSpacing),
            Obx(
              () => StrikePriceTextWidget(
                sign: TUiConstants.rupeeSign,
                price: ProductModel.getPreviousPrice(product
                        .varitaions[controller.variationIndex.value].price
                        .toDouble())
                    .toString(),
              ),
            ),
            const SizedBox(width: TUiConstants.defaultSpacing / 2),
            PriceTextWidget(
                price: '${variation.price}', sign: TUiConstants.rupeeSign),
          ],
          //Title
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        TTitleTextWidget(
          text: variation.name.isEmpty ? product.name : variation.name,
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
              product.status ? 'Available' : 'Not Available',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: TUiConstants.spaceBtwTexts),
        TShopWithVerifiedIcon(shopAddress: product.shopName),
        const SizedBox(height: TUiConstants.defaultSpacing),
      ],
    );
  }
}
