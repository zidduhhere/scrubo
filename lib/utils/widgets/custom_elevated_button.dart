import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.onTap, this.iconData});

  final dynamic onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: TColors.lightPrimaryColor,
        fixedSize: Size(THelperFunctions.getDeviceWidth(context) * .8,
            TUiConstants.buttonHeight),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TTextConstants.login,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: TColors.lightOnPrimary,
                ),
          ),
          const SizedBox(width: TUiConstants.s),
          iconData == null
              ? const SizedBox()
              : Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: TUiConstants.iconSizeMedium,
                )
        ],
      ),
    );
  }
}
