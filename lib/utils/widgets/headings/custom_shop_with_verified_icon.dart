import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TShopWithVerifiedIcon extends StatelessWidget {
  const TShopWithVerifiedIcon({
    super.key,
    required this.shopAddress,
  });

  final String shopAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 10,
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
        const SizedBox(width: TUiConstants.spaceBtwTexts / 2),
        const Flexible(
          flex: 2,
          child: Icon(
            Iconsax.verify5,
            color: Colors.blue,
            size: 20,
          ),
        )
      ],
    );
  }
}
