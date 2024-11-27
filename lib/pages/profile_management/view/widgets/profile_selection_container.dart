import 'package:flutter/material.dart';
import 'package:scrubo/pages/profile_management/view/widgets/cusotm_divider.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class ProfileSectionContainer extends StatelessWidget {
  const ProfileSectionContainer(
      {super.key,
      required this.iconData,
      required this.text,
      required this.iconColor});
  final IconData iconData;
  final Color iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: TUiConstants.paddingMedium,
              horizontal: TUiConstants.paddingLarge),
          child: Column(
            children: [
              const SizedBox(
                height: TUiConstants.defaultSpacing,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(iconData, color: iconColor),
                  ),
                  const SizedBox(width: TUiConstants.defaultSpacing),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
              const SizedBox(
                height: TUiConstants.defaultSpacing,
              ),
            ],
          ),
        ),
        const CustomDivider()
      ],
    );
  }
}
