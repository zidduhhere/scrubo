import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key, required this.text, this.iconData, required this.onTap});

  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          fixedSize: Size(
            Get.size.width * TUiConstants.buttonWidthFactor,
            TUiConstants.buttonHeight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: TUiConstants.s),
            iconData == null
                ? const SizedBox()
                : Icon(
                    iconData,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: TUiConstants.iconSizeMedium,
                  )
          ],
        ));
  }
}
