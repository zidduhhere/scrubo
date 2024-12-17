import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/buttons/custom_rounded_icon_button.dart';
import 'package:scrubo/utils/widgets/containers/custom_discount_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_shop_with_verified_icon.dart';

class ProductViewCard extends StatelessWidget {
  const ProductViewCard({
    super.key,
    required this.price,
    required this.previousPrice,
    required this.title,
    required this.imageUrl,
    required this.isNetworkImage,
    required this.shopAddress,
    this.discount,
  });
  final int price;
  final String previousPrice;
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final String shopAddress;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(TUiConstants.s, 0, TUiConstants.s, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: TUiConstants.productCardImageHeight,
            child: Stack(
              children: [
                //Product Card Image
                TRoundedImageContainer(
                  fit: BoxFit.cover,
                  isNetworkImage: isNetworkImage,
                  backgroundColor: Colors.transparent,
                  imageUrl: imageUrl,
                  padding: const EdgeInsets.all(TUiConstants.s),
                ),
                discount == null
                    ? const SizedBox()
                    : Positioned(
                        top: 10,
                        left: 10,
                        height: 20,
                        width: 40,
                        child: DiscountContainer(discount: discount.toString()),
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TUiConstants.s),
            child:
                //Texts for product card
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600),
                ),
                TShopWithVerifiedIcon(shopAddress: shopAddress),
                const SizedBox(
                  height: TUiConstants.m,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TUiConstants.s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriceTextWidget(
                        sign: TUiConstants.rupeeSign, price: price.toString()),
                    const SizedBox(width: TUiConstants.s),
                    StrikePriceTextWidget(
                        price: previousPrice, sign: TUiConstants.rupeeSign),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  //TODO: Implement increment count and design a function

                  // bool success = homeViewController.incrementCount();
                  // if (!success) {
                  //   Get.snackbar(
                  //     TTextConstants.snackBarTitle,
                  //     TTextConstants.snackBarDescription,
                  //     snackStyle: SnackStyle.FLOATING,
                  //     colorText: Colors.white,
                  //     icon: const Icon(
                  //       Iconsax.warning_2,
                  //       color: TColors.darkError,
                  //     ),
                  //     backgroundColor: TColors.lightPrimaryColor,
                  //   );
                  // }
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: TRoundedIconButton(
                    icon: TUiConstants.iconAdd,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
