import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/data/repositories/user/user_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/formatter/welcome_formatter.dart';
import 'package:scrubo/utils/widgets/cards/custom_cached_image.dart';
import 'package:scrubo/utils/widgets/containers/circular_image_container.dart';

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
      this.isProfileImage = false,
      this.imageUrl,
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
        ),
        assert(
          !isProfileImage || imageUrl != null,
          'imageUrl must be provided if isProfileImage is true',
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
  final bool isProfileImage;
  final String? imageUrl;
  final IconData? badgeIcon;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // floating: true,
      pinned: true,
      // snap: true,
      title: Padding(
        padding: TSpacingStyles.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TWelcomeFormatter.getWelcomeMessage(DateTime.now()),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500),
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
      ),
      centerTitle: centerTile,
      backgroundColor: Theme.of(context).colorScheme.surface,
      scrolledUnderElevation: 0,
      toolbarHeight: TUiConstants.appBarheight,
      actions: [
        Padding(
          padding: TSpacingStyles.paddingScaffold,
          child: profileIcon
              ? GestureDetector(
                  onTap: () => Get.toNamed('/profile'),
                  child: isProfileImage
                      ? TCircualrImage(
                          imageUrl: imageUrl!,
                          isNetworkImage: true,
                          width: 40,
                          height: 40,
                        )
                      : CircleAvatar(
                          radius: TUiConstants.borderRadiusCircleAvatar,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          child: const Icon(Iconsax.user),
                        ),
                )
              : const SizedBox(),
        )
        // const SizedBox(width: TUiConstants.s),
      ],
    );
  }
}

class TCustomNormalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TCustomNormalAppBar(
      {super.key,
      this.title,
      this.titlemsg,
      this.badgeVal,
      this.leading = false,
      this.trailing = false,
      this.trailingWidgets,
      this.backgroundColor,
      this.titleColor,
      this.customStyle = false,
      this.subtitleColor,
      this.badge = false,
      this.centerTile = false,
      this.isProfileImage = false,
      this.imageUrl,
      required this.profileIcon,
      this.badgeIcon,
      this.padding,
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
        ),
        assert(
          !customStyle || (titleColor != null && subtitleColor != null),
          'titleStyle and subtitleSytle must be provided if customStyle is true',
        );

  final String? title;
  final String? titlemsg;
  final int? badgeVal;
  final bool profileIcon;
  final bool leading;
  final bool badge;
  final bool customStyle;
  final bool isProfileImage;
  final String? imageUrl;
  final Color? titleColor;
  final Color? subtitleColor;
  final bool trailing;
  final bool centerTile;
  final Color? backgroundColor;
  final VoidCallback? badgeOnPresed;
  final List<Widget>? trailingWidgets;
  final IconData? badgeIcon;
  final EdgeInsets? padding;

  @override
  Size get preferredSize => const Size.fromHeight(TUiConstants.appBarheight);

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return AppBar(
      // floating: true,

      // snap: true,
      title: Padding(
        padding: TSpacingStyles.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titlemsg ?? "",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: customStyle
                      ? titleColor
                      : Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              title ?? "",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: TUiConstants.fontSizeMediumLarge,
                    fontWeight: FontWeight.w500,
                    color: customStyle
                        ? subtitleColor
                        : Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      centerTitle: centerTile,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      scrolledUnderElevation: 0,

      toolbarHeight: TUiConstants.appBarheight,
      actions: [
        Padding(
            padding: TSpacingStyles.paddingScaffold,
            child: profileIcon
                ? GestureDetector(
                    onTap: () => Get.toNamed('/profile'),
                    child: TCachedNetworkImageContainer(
                      width: 40,
                      height: 40,
                      image: userController.user.value.photoUrl,
                      subIcon: TUiConstants.iconUser,
                      radius: 100,
                    ),
                  )
                : const SizedBox()),
        if (trailing) ...trailingWidgets! else const SizedBox()

        // const SizedBox(width: TUiConstants.s),
      ],
    );
  }
}
