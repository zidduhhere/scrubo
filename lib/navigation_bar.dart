import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
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
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  Map<int, Map<String, dynamic>> bottomNavBarItems = {
    0: {
      "iconData": Iconsax.home,
      "label": "Home",
    },
    1: {
      "iconData": Iconsax.search_normal,
      "label": "Search",
    },
    2: {
      "iconData": Iconsax.shopping_bag,
      "label": "Cart",
    },
    3: {
      "iconData": Iconsax.user,
      "label": "Profile",
    },
  };
}
