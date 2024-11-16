import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class AddressSelectionHeader extends StatelessWidget {
  const AddressSelectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TUiConstants.appBarheight,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(width: TUiConstants.s),

          //Address selection header
          Row(
            children: [
              IconButton.outlined(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                        TUiConstants.borderRadiusLarge *
                            TUiConstants.iconButtonWidthFactor),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Iconsax.menu),
              ),
              const SizedBox(width: TUiConstants.s / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTextConstants.home,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Row(
                    children: [
                      Text(
                        TTextConstants.sampleAddress,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(width: TUiConstants.s / 2),
                      const Icon(Iconsax.arrow_down_14,
                          size: TUiConstants.iconSizeMedium),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton.outlined(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    TUiConstants.borderRadiusLarge *
                        TUiConstants.iconButtonWidthFactor),
              ),
            ),
            onPressed: () {},
            icon: const Icon(
              Iconsax.search_normal,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
