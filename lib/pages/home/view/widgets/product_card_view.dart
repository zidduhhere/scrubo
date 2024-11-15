import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/view/home_view_controller.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/custom_rounded_containers.dart';

class ProductViewCard extends StatelessWidget {
  const ProductViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewController homeViewController = Get.find<HomeViewController>();
    return Container(
      width: 180,
      margin: const EdgeInsets.fromLTRB(TUiConstants.s, 0, TUiConstants.s, 0),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusLarge),
        color: Theme.of(context).colorScheme.surfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(2, 0),
            blurRadius: 1,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
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
                const TRoundedImageContainer(
                  isNetworkImage: false,
                  backgroundColor: Colors.transparent,
                  imageUrl: TImages.carTransperent,
                  padding: EdgeInsets.all(TUiConstants.s),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  height: 20,
                  width: 40,
                  child: TRoundedContainer(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    height: 20,
                    diffRadius: true,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(TUiConstants.s),
                        bottomLeft: Radius.circular(TUiConstants.s / 2),
                        bottomRight: Radius.circular(TUiConstants.s),
                        topLeft:
                            Radius.circular(TUiConstants.borderRadiusLarge)),
                    child: Center(
                      child: Text(
                        TTextConstants.discount,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
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
            // padding: EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: TUiConstants.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTextConstants.carWashDecs,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Flexible(
                      // flex: 2,
                      child: Text(
                        TTextConstants.shopAddress,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Icon(
                      Iconsax.verify,
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
                      homeViewController.secondPrice,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      homeViewController.firstPrice,
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
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      bool success = homeViewController.incrementCount();
                      if (!success) {
                        Get.snackbar(
                          "Maximum limit reached",
                          "You can only add a maximum of 10 of each product",
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
                        topLeft:
                            Radius.circular(TUiConstants.borderRadiusLarge),
                        bottomRight: Radius.circular(
                          TUiConstants.borderRadiusLarge,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        homeViewController.countOfItem.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
