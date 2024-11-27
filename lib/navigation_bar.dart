import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/pages/profile_management/view/profile_management_view.dart';
import 'package:scrubo/pages/service_scheduling/view/service_scheduling_view.dart';
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

class NavigationMenuController extends GetxController {
  RxInt currentPage = 0.obs;
  int navigationMenuItemsCount = 4;
  void changePage(int index) {
    currentPage.value = index;
  }

  List<Widget> screens = [
    const HomeView(),
    const ServiceSchedulingView(),
    Container(
      color: Colors.blue,
    ),
    const ProfileManagementView(),
  ];

  Map<int, Map<String, dynamic>> bottomNavBarItems = {
    0: {
      "iconData": Iconsax.home,
      "label": "Home",
    },
    1: {
      "iconData": Iconsax.ticket,
      "label": "Previous",
    },
    2: {
      "iconData": Iconsax.flash,
      "label": "Instant",
    },
    3: {
      "iconData": Iconsax.user,
      "label": "Profile",
    },
  };
}
