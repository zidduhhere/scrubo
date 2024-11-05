import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/view/home_view_controller.dart';
import 'package:scrubo/utils/constants/constants.dart';
import 'package:badges/badges.dart' as badges;
import 'package:scrubo/utils/constants/uiconstants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static HomeViewController homeviewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
          [
            AppBar(
              title: const Text(TTextConstants.home),
              actions: [
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                      borderRadius: BorderRadius.circular(10),
                      shape: badges.BadgeShape.circle,
                      badgeColor: Theme.of(context).colorScheme.errorContainer),
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  badgeContent: Obx(() => Text(
                        homeviewController.badgeNumber.value.toString(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer,
                            ),
                      )),
                  child: IconButton(
                    onPressed: () {
                      homeviewController.badgeNumber.value++;
                    },
                    icon: const Icon(Iconsax.notification),
                  ),
                ),
                const SizedBox(width: TUiConstants.s / 2),
                CircleAvatar(
                  radius: TUiConstants.borderRadiusCircleAvatar,
                  backgroundColor: Theme.of(context).colorScheme.primaryFixed,
                  child: const Icon(Iconsax.user),
                ),
                const SizedBox(width: TUiConstants.s),
              ],
            )
          ],
        ),
      ),
    );
  }
}
