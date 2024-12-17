import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/navigation_controller.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationMenuController navigationMenuController =
        Get.put(NavigationMenuController());
    return Scaffold(
      body: Obx(() => navigationMenuController
          .screens[navigationMenuController.currentPage.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          height: TUiConstants.bottomNavigationBarHeight,
          elevation: 3,
          selectedIndex: navigationMenuController.currentPage.value,
          onDestinationSelected: (int index) =>
              navigationMenuController.changePage(index),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: List.generate(
            navigationMenuController.navigationMenuItemsCount,
            (index) => NavigationDestination(
              icon: Icon(
                navigationMenuController.bottomNavBarItems[index]!["iconData"],
              ),
              label:
                  navigationMenuController.bottomNavBarItems[index]!["label"],
            ),
          ),
        ),
      ),
    );
  }
}
