import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class TSettingsTile extends StatelessWidget {
  const TSettingsTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      required this.icon,
      this.onTap});

  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: TUiConstants.iconSizeLarge,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        trailing: trailing,
      ),
    );
  }
}
