import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:badges/badges.dart' as badges;

class TCustomAppBar extends StatelessWidget {
  const TCustomAppBar(
      {super.key,
      this.title,
      this.titlemsg,
      this.badgeVal,
      this.leading = false,
      this.trailing = false,
      this.trailingWidgets,
      required this.backgroundColor,
      this.badge = false,
      this.centerTile = false,
      required this.profileIcon,
      this.badgeIcon,
      this.badgeOnPresed})
      : assert(
          !badge ||
              badgeVal != null ||
              badgeIcon != null ||
              badgeOnPresed != null,
          'badgeVal must be provided if trailing is true',
          // 'badgeIcon must be provided if trailing is true',
        ),
        assert(
          !trailing || trailingWidgets != null,
          'trailingWidgets must be provided if trailing is true',
        );

  final String? title;
  final String? titlemsg;
  final int? badgeVal;
  final bool profileIcon;
  final bool leading;
  final bool badge;
  final bool trailing;
  final bool centerTile;
  final Color backgroundColor;
  final VoidCallback? badgeOnPresed;
  final List<Widget>? trailingWidgets;
  final IconData? badgeIcon;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // floating: true,
      pinned: true,
      // snap: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titlemsg ?? "",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w300),
          ),
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: TUiConstants.fontSizeMediumLarge,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      centerTitle: centerTile,
      backgroundColor: Theme.of(context).colorScheme.surface,
      scrolledUnderElevation: 0,
      toolbarHeight: TUiConstants.appBarheight,
      actions: [
        badge
            ? badges.Badge(
                badgeStyle: badges.BadgeStyle(
                    borderRadius:
                        BorderRadius.circular(TUiConstants.borderRadiusSmall),
                    shape: badges.BadgeShape.circle,
                    badgeColor: Theme.of(context).colorScheme.errorContainer),
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeContent: Text(
                  badgeVal.toString(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                ),
                child: IconButton(
                  onPressed: badgeOnPresed,
                  icon: Icon(badgeIcon),
                ))
            : const SizedBox(),
        const SizedBox(width: TUiConstants.s / 2),
        profileIcon
            ? CircleAvatar(
                radius: TUiConstants.borderRadiusCircleAvatar,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: const Icon(Iconsax.user),
              )
            : const SizedBox(),
        // const SizedBox(width: TUiConstants.s),
      ],
    );
  }
}
