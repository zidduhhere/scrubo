import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/helpers/helper_functions.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onTap, this.iconData, required this.text});

  final dynamic onTap;
  final IconData? iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: TColors.lightPrimaryColor,
        fixedSize: Size(
            THelperFunctions.getDeviceWidth(context) *
                TUiConstants.buttonWidthFactor,
            TUiConstants.buttonHeight),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const SizedBox(width: TUiConstants.s),
          iconData == null
              ? const SizedBox()
              : Icon(
                  iconData,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: TUiConstants.iconSizeMedium,
                )
        ],
      ),
    );
  }
}
