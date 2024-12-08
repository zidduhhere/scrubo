import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';

class TCouponContainer extends StatelessWidget {
  const TCouponContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TUiConstants.s),
      border: Border.all(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: TextField(
              cursorColor: TColors.lightOnSurface,
              textCapitalization: TextCapitalization.words,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: TColors.lightOnSurface,
                  ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Have coupon code ? Enter here '),
            ),
          ),
          Expanded(
            flex: 4,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(TUiConstants.borderRadiusMedium),
                ),
                backgroundColor: TColors.lightSurfaceContainerHigh,
              ),
              onPressed: () {},
              child: Text(
                'Apply',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
