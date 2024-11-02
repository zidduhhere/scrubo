import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.text, this.iconData});

  final String text;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          fixedSize: Size(
            Get.size.width * .8,
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
