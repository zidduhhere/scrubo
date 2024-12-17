import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/buttons/custom_rounded_icon_button.dart';
import 'package:scrubo/utils/widgets/containers/custom_discount_containers.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/headings/custom_price_text_views.dart';
import 'package:scrubo/utils/widgets/headings/custom_shop_with_verified_icon.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class TCategoryProductContainer extends StatelessWidget {
  const TCategoryProductContainer({
    super.key,
    required this.title,
    required this.price,
    required this.discount,
    required this.shopAddress,
  });

  final String title;
  final String price;
  final String discount;
  final String shopAddress;

  @override
  Widget build(BuildContext context) {
    return TSizeAdjustableRoundedContainer(
      width: TDeviceUtility.getDeviceWidth(context) * 0.85,
      diffRadius: true,
      backgroundColor: TColors.lightSurfaceContainerHigh,
      borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge * 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Product Image
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: TSizeAdjustableRoundedContainer(
                    diffRadius: true,
                    borderRadius:
                        BorderRadius.circular(TUiConstants.borderRadiusLarge),
                    width: 130,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      TImages.car,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: DiscountContainer(discount: discount),
                ),
              ],
            ),
          ),
          const SizedBox(width: TUiConstants.defaultSpacing),
          Expanded(
            child: Flex(
              mainAxisSize: MainAxisSize.max,
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TUiConstants.defaultSpacing),
                //Product Title
                TTitleTextWidget(text: title),
                const SizedBox(height: TUiConstants.spaceBtwTexts / 2),
                SizedBox(
                  width: 200,
                  child: TShopWithVerifiedIcon(shopAddress: shopAddress),
                ),
                const SizedBox(height: TUiConstants.spaceBtwTexts),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriceTextWidget(
                      price: price,
                      sign: TUiConstants.rupeeSign,
                    ),
                    const TRoundedIconButton(
                      icon: TUiConstants.iconAdd,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(TUiConstants.borderRadiusLarge),
                        bottomRight: Radius.circular(
                          TUiConstants.borderRadiusLarge,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
