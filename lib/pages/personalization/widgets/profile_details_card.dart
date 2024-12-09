import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProfileDetailsContainer extends StatelessWidget {
  const ProfileDetailsContainer(
      {super.key,
      required this.property,
      required this.value,
      this.trailingIcon,
      required this.onPressed});

  final String property;
  final String value;
  final IconData? trailingIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 3, child: Text(property)),
            Expanded(
                flex: 6,
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: TColors.lightOnSurface),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: onPressed,
                    child: Icon(trailingIcon ?? TUiConstants.iconArrowRight)))
          ],
        ),
        const SizedBox(height: TUiConstants.cardSpacing),
      ],
    );
  }
}
