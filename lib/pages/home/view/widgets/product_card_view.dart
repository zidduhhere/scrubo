import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/viewmodel/home_view_controller.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_rounded_containers.dart';

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
  final String price;
  final String previousPrice;
  final String title;
  final String imageUrl;
  final bool isNetworkImage;
  final String shopAddress;
  final String? discount;

  @override
  Widget build(BuildContext context) {
    HomeViewController homeViewController = Get.find<HomeViewController>();
    return Container(
      width: 180,
      margin: const EdgeInsets.fromLTRB(TUiConstants.s, 0, TUiConstants.s, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
        color: Theme.of(context).colorScheme.surfaceContainer,
        // boxShadow: [
        //   TShadowStyles.horizontalShadow,
        //   TShadowStyles.verticalShadow
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: TUiConstants.productCardImageHeight,
            child: Stack(
              children: [
                //Product Card Image
                TRoundedImageContainer(
                  isNetworkImage: isNetworkImage,
                  backgroundColor: Colors.transparent,
                  imageUrl: imageUrl,
                  padding: const EdgeInsets.all(TUiConstants.s),
                ),
                discount == null
                    ? const SizedBox()
                    : Positioned(
                        top: 10,
                        left: 5,
                        height: 20,
                        width: 40,
                        child: TRoundedContainer(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          height: 20,
                          diffRadius: true,
                          borderRadius: BorderRadius.circular(
                              TUiConstants.borderRadiusSmall),
                          child: Center(
                            child: Text(
                              discount!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                            ),
                          ),
                        ),
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
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        shopAddress,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                      size: 20,
                    )
                  ],
                ),
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
                    Text(
                      previousPrice.toString(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      price.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: 1.0,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    bool success = homeViewController.incrementCount();
                    if (!success) {
                      Get.snackbar(
                        TTextConstants.snackBarTitle,
                        TTextConstants.snackBarDescription,
                        snackStyle: SnackStyle.FLOATING,
                        colorText: Colors.white,
                        icon: const Icon(
                          Iconsax.warning_2,
                          color: TColors.darkError,
                        ),
                        backgroundColor: TColors.lightPrimaryColor,
                      );
                    }
                  },
                  child: TRoundedContainer(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    height: 40,
                    width: 50,
                    diffRadius: true,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TUiConstants.borderRadiusLarge),
                      bottomRight: Radius.circular(
                        TUiConstants.borderRadiusLarge,
                      ),
                    ),
                    child: Center(
                        child: Icon(
                      Iconsax.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )),
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
