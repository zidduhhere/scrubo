import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class DateTimeSelectionTile extends StatelessWidget {
  const DateTimeSelectionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(leadingIcon),
        title: Text(title),
        subtitle: Text(subtitle),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: TColors.lightSurfaceContainerHigh),
          borderRadius: BorderRadius.all(
            Radius.circular(
              TUiConstants.borderRadiusMedium,
            ),
          ),
        ),
      ),
    );
  }
}
